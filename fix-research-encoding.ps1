param(
    [string]$Path = ".\research.html"
)

$ErrorActionPreference = "Stop"

function Get-SuspiciousScore {
    param([string]$s)

    $score = 0
    foreach ($ch in $s.ToCharArray()) {
        $n = [int][char]$ch
        if ($n -eq 0x00C3 -or $n -eq 0x00C5 -or $n -eq 0x00E2) { $score += 2 } # Ã Å â
        if ($n -eq 0xFFFD) { $score += 10 } # replacement char
    }
    return $score
}

function Repair-MojibakeToken {
    param([string]$token)

    $cp1252 = [System.Text.Encoding]::GetEncoding(1252)
    $utf8   = [System.Text.Encoding]::UTF8

    try {
        $bytes = $cp1252.GetBytes($token)
        $fixed = $utf8.GetString($bytes)

        if ((Get-SuspiciousScore $fixed) -lt (Get-SuspiciousScore $token)) {
            return $fixed
        } else {
            return $token
        }
    }
    catch {
        return $token
    }
}

$FullPath = (Resolve-Path -LiteralPath $Path).Path
$BackupPath = $FullPath + ".bak"

Copy-Item -LiteralPath $FullPath -Destination $BackupPath -Force

$text = [System.IO.File]::ReadAllText($FullPath)

# Remove BOM if present as a literal character in the text
if ($text.Length -gt 0 -and [int][char]$text[0] -eq 0xFEFF) {
    $text = $text.Substring(1)
}

# Repair suspicious non-whitespace tokens only
$text = [regex]::Replace(
    $text,
    '\S+',
    {
        param($m)

        $token = $m.Value

        if (
            $token.IndexOf([char]0x00C3) -ge 0 -or  # Ã
            $token.IndexOf([char]0x00C5) -ge 0 -or  # Å
            $token.IndexOf([char]0x00E2) -ge 0      # â
        ) {
            return Repair-MojibakeToken $token
        }

        return $token
    }
)

# Save as UTF-8 without BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($FullPath, $text, $utf8NoBom)

Write-Host ""
Write-Host "Backup created: $BackupPath"
Write-Host "Fixed file:     $FullPath"
Write-Host ""

# Report any likely leftovers
$leftovers = $text -split "`r?`n" | Where-Object {
    $_.IndexOf([char]0x00C3) -ge 0 -or
    $_.IndexOf([char]0x00C5) -ge 0 -or
    $_.IndexOf([char]0x00E2) -ge 0
}

if ($leftovers.Count -gt 0) {
    Write-Host "Possible leftovers:" -ForegroundColor Yellow
    $leftovers | ForEach-Object { Write-Host $_ }
}
else {
    Write-Host "No obvious mojibake remains." -ForegroundColor Green
}