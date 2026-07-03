# fix-journal-name-links.ps1
param(
    [string]$Path = ".\research.html",
    [switch]$DryRun
)

$text = Get-Content -LiteralPath $Path -Raw

# Match only:
#   <span class="journal-name"><a ...>...</a>
# optionally followed immediately by </span>
#
# This does NOT touch the already-good form:
#   <a ...><span class="journal-name">...</span></a>
$pattern = '(?s)<span\s+class=(["''])journal-name\1>(?<innerws>\s*)<a\b(?<attrs>[^>]*)>(?<label>.*?)</a>(?<after>\s*)(?:</span>)?'

$count = 0

$newText = [regex]::Replace($text, $pattern, {
    param($m)

    $script:count++

    $innerws = $m.Groups['innerws'].Value
    $attrs   = $m.Groups['attrs'].Value
    $label   = $m.Groups['label'].Value
    $after   = $m.Groups['after'].Value

    return ('{0}<a{1}><span class="journal-name">{2}</span></a>{3}' -f $innerws, $attrs, $label, $after)
})

if ($DryRun) {
    Write-Host "Would fix $count journal-name link(s). No file was changed."
    exit
}

if ($count -eq 0) {
    Write-Host "No matching journal-name link issues found. No file was changed."
    exit
}

$backupPath = "$Path.bak"
Copy-Item -LiteralPath $Path -Destination $backupPath -Force

Set-Content -LiteralPath $Path -Value $newText -NoNewline -Encoding UTF8

Write-Host "Fixed $count journal-name link(s)."
Write-Host "Backup saved to $backupPath"