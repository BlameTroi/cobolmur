MURACH'S STRUCTURED COBOL

Thank you for purchasing Murach's Structured COBOL. This book and its 
accompanying CD have been designed to help you learn COBOL as efficiently and 
effectively as possible. The information that follows will summarize the files
contained on this CD and explain how to install these files on your system. Once
you install them, you can review the Readme file that's placed in the COBOL
folder on your hard drive for more information on using these files.


HOW THIS CD IS ORGANIZED

This CD contains the source code, data files, and copy members used by our book. 
It also contains a generic version of the exercises presented in this book. 
Since the exercises in the book include information that's specific to the Micro 
Focus Personal COBOL compiler, you may want to use the generic exercises if 
you're using a compiler other than Personal COBOL.

The files on this CD are organized into the following folders:

--------------------------------------------------------------------------------
Folder		Contents
--------------------------------------------------------------------------------

cobol		A Readme.txt file and the programs needed for
		the exercises for chapters 2 through 5

cobol\chapxx	The sample programs presented in chapter xx and the programs 
		needed for the exercises at the end of that chapter

cobol\copy	The copy members used by some of the student projects

cobol\data	The data files for the program examples, exercises, and 
		student projects

cobol\exercises	A generic version of the exercises presented in the book

cobol\extras	A Word file named screen layout.doc that you can use to design 
		the screen layouts for the student projects for chapter 17

cobol\listmods	The COBOL source file for a program named LISTMODS that you 
		can use to generate a structure listing from your COBOL 
		programs, plus listmods.doc and listmods.txt files that tell 
		you how to use this program

cobol\oldprogs	An empty folder where you can copy your completed programs

HOW TO INSTALL THESE FILES

The easiest way to install the files on this CD onto your system is to execute the
Install program in the root directory of the CD. To do that, just double-click on
the Install.exe file. Then, the Install program will display a series of screens.
If you want to install the files in the COBOL folder on your C drive, which is what
we recommend, you can just accept the defaults on each screen.

In addition to copying the files you'll use with our book to your system, the Install
program also copies an Uninstall program that you can use to remove the files from
your system. This program is available from the Murach's Structured COBOL group that
the Install program adds to the Windows Programs menu. This group also includes a
shortcut to the Readme text file that's stored in the c:\cobol folder. This file
contains more information on how to use the installed files with our book.

Another way to install these files on your system is to copy the entire
COBOL folder from the CD to your C drive. Or, to copy selected files, you can 
create a folder named COBOL on your C drive and then copy the subfolders and files 
you want from the CD to the COBOL folder. If you use this technique, you should know
that the files will be read-only. Because of that, you won't be able to modify them
without removing the read-only attribute.

To remove this attribute, you can issue a DOS command like this:

	attrib -r c:\cobol\*.* /s

This command will remove the read-only attribute from all of the files in the c:\cobol
folder and all of its subfolders. The easiest way to issue this command is to choose
the Run command from the Windows Start menu and then enter the command into the
dialog box that's displayed.

You can also remove the read-only attribute from these files using the Windows Explorer.
Unfortunately, you can only change the attributes for the files in one folder at a time.
To do that, select all the files in the folder, then right-click on the selected files.
Next, select the Properties command from the menu that's displayed to display the
Properties dialog box. Then, click on the check box for the read-only attribute to
remove the check mark, and click on the OK button to accept the changes.

If you copy some of the files to your system and then decide to use the Install program
to install all of the files, you should know that this program will not replace any
files that are read-only. That's because read-only files can't be overwritten. In this
case, you'll need to delete the read-only files before you run Install.
