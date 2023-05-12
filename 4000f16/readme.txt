
		        Maple V Release 4
		        =================

		          Version 4.00b
		          -------------

			     Read Me
			     -------


Welcome to Maple V Release 4---The Power Edition!

This file describes the following topics:

   1. Installation under Windows 3.1 or Windows 95
         ...from Diskettes
         ...by FTP

   2. Installation under Windows NT
         ...from Diskettes
         ...by FTP

   3. What's New?
	 ...New Features
	 ...Bugs Fixed
	 ...Improved Editing

   4. Further Assistance


This patch modifies your original installation of Maple V Release 4.
It makes the improvements listed below.  All the features below are
included in the Macintosh version of Maple V Release 4, so no
upgrade is necessary.

Later Windows versions are also version 4.00b.  Start Maple V, then
choose "About Maple V..." from the "Help" menu to check your copy.
If you already have version 4.00b or higher, do not apply this patch.



Installation under Windows 3.1 or Windows 95
============================================


Installation from Diskettes
---------------------------

1. Insert Disk 1 of the Maple V patch disks. 

2. Within the Windows 95 environment, select "Start/Run..." or,
   from either Windows 3.1, choose "File/Run...".  Enter "a:install",
   then press the Enter key.

3. Follow the instructions that the installer provides:  Enter the
   location of your Maple directory.  Insert the second diskette
   if asked to do so.

4. The installer will open a DOS Window and the installation will
   proceed.  Ignore messages concerning missing files.  When finished,
   the installer may not be able to close the DOS window. 
   Simply close the window yourself.


Installation via FTP
--------------------

1. Download patch4b.zip using binary transfer mode.  If you do not
   have "pkunzip", also get "pkunzip.exe" using binary transfer mode.
   A copy is located in the same directory as the patch file.

2. Open a DOS shell and locate the .zip file, then use the command
   "pkunzip -d patch4b.zip" to create the directory "patch4b" and
   uncompress the files.

3. Change into this new directory, then issue the command ".\install"
   at the DOS prompt.

4. Follow the instructions that the installer provides:  Enter the
   location of your Maple directory.

5. The installer will open a DOS Window and proceed to apply the
   patch.  Ignore messages concerning missing files.  When finished,
   the installer may not be able to close the DOS Window on some
   platforms.  Simply close the window yourself.



Installation under Windows NT
=============================

From Diskettes
--------------

1. Start Maple V.  Choose "About Maple V..." from the "Help" menu.
   The About box will indicate which version of Maple you have.

2. Open a DOS shell and change to your Maple directory.  Insert one
   of the disks and issue one of the following commands, depending
   upon your version of Maple V:

   If no version number is shown, insert "Disk 1" and use the command
      a:patch m400-40b.rtp

   If you have version 4.00a, insert "Disk 2" and use the command
      a:patch m40a-40b.rtp

   If you already have version 4.00b or higher, do not apply either patch.

   Ignore any messages concerning missing files.

Via FTP
-------

1. Download the archive "patch4b.zip" to a temporary directory on
   your computer using binary transfer mode.  Also download
   "pkunzip.exe", if you do not already have a copy.

2. Open a DOS shell and locate the .zip file, then use the command
   "pkunzip -d patch4b.zip" to create the directory "patch4b" and
   uncompress the files.

3. Start Maple V.  Choose "About Maple V..." from the "Help" menu.
   The About box will indicate which version of Maple you have.
   Now, exit from Maple in order to apply the patch.

4. Open a DOS shell and change to your Maple directory.  Issue one
   of the following commands, depending upon your version of Maple V.
   The commands below assume that the patch is located in
   "c:\temp\patch4b".  If you placed it somewhere else, modify the
   commands below as appropriate.

    c:\temp\patch4b\patch m400-40b.rtp  - if no version letter is shown
    c:\temp\patch4b\patch m40a-40b.rtp  - if you have version 4.00a

   If you already have version 4.00b, do not apply either patch.
   Ignore any messages concerning missing files.



What's New
==========

New Features
------------

 - Improved Print Preview
 - Real-math output may now be copied as a metafile and pasted into
   other applications, such as word processors.
 - "makehelp" can now make a help page from either a text file or a
   worksheet.
 - File History provides quick access to recently used worksheets.
 - Pop-up menus for window plots
 - Context help now works on Maple output.
 - System resource information displayed under Windows 3.1 and
   Windows 95.

Bugs Fixed
----------

 - Menu items are now grayed out when they can't be used.
 - Improved screen refresh.
 - Correct selection for all parts of worksheets
 - "Show Invisibles" now shows non-printing characters properly.
 - When exporting to LaTeX, the \times symbol is now used for
   multiplications within procedures.
 - Improved line-breaking of math.
 - Improved display of brackets and conjugate operators.
 - Spaces are now handled properly in host names and file names.
 - Efficiency improvements in plot and linalg[multiply]
 - Improvements to piecewise, simplify[Heaviside], simplify[unitstep],
   convert[piecewise], and dsolve
 - Improved printing of large worksheets
 - Improved robustness

Improved Editing
----------------

 - You can now change the font, size, and style of Maple input and
   output.
 - Triple-clicking on an inline plot selects the entire paragraph.
 - Plots may now be right, left, or center-aligned.
 - Hyperlinks may now be created to bookmarks within a collapsed
   section.


Further Assistance
==================

For further assistance, please contact your Maple Technical Support
Representative.
