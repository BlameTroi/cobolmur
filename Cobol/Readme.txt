MURACH'S STRUCTURED COBOL

Thank you for purchasing Murach's Structured COBOL. This book and its 
accompanying CD have been designed to help you learn COBOL as efficiently and 
effectively as possible. The information that follows will help you use the 
files you installed from the CD to accomplish that goal.


HOW THE FILES ARE ORGANIZED

The files you installed on your system include the source code, data files, and copy
members used by our book. Also included is a generic version of the exercises presented
in this book. Since the exercises in the book include information that's specific to the
Micro Focus Personal COBOL compiler, you may want to use the generic exercises if you're
using a compiler other than Personal COBOL.

The files are organized into the following folders:

--------------------------------------------------------------------------------
Folder		Contents
--------------------------------------------------------------------------------

cobol		This Readme file and the programs needed for the exercises
		for chapters 2 through 5

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

HOW TO USE THESE FILES

Before you use the source files for the exercises that were installed on your system,
you should copy them from the chapter folder that contains them to the COBOL folder. 
That way, you can find them easily in Personal COBOL by setting the default 
folder to c:\cobol as instructed in exercise 2-1. Also, if you make a mistake 
as you modify a program and want to start over, you can revert to the original 
file in the chapter folder. Note that the source files you need to do the 
exercises for chapters 2 through 5 have already been copied to the COBOL folder 
for you. The exercise descriptions will instruct you to copy the other source 
files at the appropriate time.

For each exercise that asks you to modify an existing program or develop a new 
program, you will be given a starting program so you don't have to create the 
new program from scratch. In some cases, the starting program is one that you 
created in an exercise in an earlier chapter. In case you don't do all the 
exercises, though, we have provided you with the starting programs you'll need 
for each exercise. The exception is if the starting program is a program you
created in an earlier exercise in the same chapter. In that case, you'll have to 
do the earlier exercise first.

After you complete the exercises for each section, you will need to move your 
completed programs to the cobol\oldprogs folder. That way, the programs in the 
COBOL folder will be kept to a minimum, and your new programs will be easier to 
locate. In addition, the starting programs we provide for some of the chapters 
have the same names as programs you may have created in an earlier chapter. So 
moving your completed programs to another folder will eliminate some confusion. 
The exercise descriptions will instruct you to move your old files to the 
oldprogs folder at the appropriate time.

In addition to the programs you'll need to do the exercises in the book, we have
provided the complete sample programs that are presented throughout the 
book. If you'd like, you can run these programs to see how they work as you read 
about them. Many of these programs are used in the exercises at the end of each 
chapter, though, so you can also get experience working with them there.

We have also provided you with the data files and copy members you'll need to do
the student projects included at the end of the book. For complete information on
using these files, please see the project descriptions.

All of the programs we've provided were written using Micro Focus Personal COBOL. 
Except for the interactive full-screen program in chapter 17, though, all of the 
programs use standard COBOL. So you should be able to use these programs with any 
compiler with little or no modification.


THE PROGRAM FILES

--------------------------------------------------------------------------------
Chapter 1
--------------------------------------------------------------------------------
calc1000.cbl	The calculate sales tax program presented in figure 1-4
calc2000.cbl	The calculate future value program presented in figure 1-21

--------------------------------------------------------------------------------
Chapter 2
--------------------------------------------------------------------------------
calc1000.cbl	The calculate sales tax program used by exercise 2-2
calc100x.cbl	The calculate sales tax program with bugs used by exercise 2-3
calc2000.cbl	The calculate future value program used by exercises 2-1 and 
		2-4

--------------------------------------------------------------------------------
Chapter 3
--------------------------------------------------------------------------------
rpt1000.cbl	The customer sales report program presented in figure 3-3 and 
		used by exercise 3-1
rpt1000x.cbl	The customer sales report program with bugs used by exercise 
		3-2

--------------------------------------------------------------------------------
Chapter 4
--------------------------------------------------------------------------------
rpt2000.cbl	The enhanced customer sales report program used by exercise 
		4-1
listmods.cbl	The structure listing program used by exercise 4-4

-------------------------------------------------------------------------------- 
Chapter 5
--------------------------------------------------------------------------------
calc2000.cbl	The calculate future value program presented in figure 1-21 
		and used by exercise 5-1
rpt3000.cbl	The customer sales report program with branch totals used by 
		exercise 5-2

--------------------------------------------------------------------------------
Chapter 6
--------------------------------------------------------------------------------
rpt3000.cbl	The customer sales report program with branch totals used by 
		exercise 6-1

--------------------------------------------------------------------------------
Chapter 7
--------------------------------------------------------------------------------
calc2000.cbl	The calculate future value program used by exercise 7-1

--------------------------------------------------------------------------------
Chapter 8
--------------------------------------------------------------------------------
date1000.cbl	The calculate elapsed days program used by exercise 8-1
date2000.cbl	The get user dates program used by exercise 8-3

--------------------------------------------------------------------------------
Chapter 9
--------------------------------------------------------------------------------
char1000.cbl	The edit numeric entry program used by exercise 9-1
char2000.cbl	The convert name entry to cap/lowercase program used by 
		exercise 9-2
char3000.cbl	The edit zip code entry program used by exercise 9-3

--------------------------------------------------------------------------------
Chapter 10
--------------------------------------------------------------------------------
rpt3000.cbl	The customer sales report program with branch totals used by 
		exercise 10-1
tbl1000.cbl	The insurance rate display program used by exercise 10-5

--------------------------------------------------------------------------------
Chapter 11
--------------------------------------------------------------------------------
rpt1000.cbl	The customer sales report program used by exercise 11-1
calc2000.cbl	The calculate future value program used by exercise 11-2
date2000.cbl	The get user dates program used by exercise 11-3

--------------------------------------------------------------------------------
Chapter 13
--------------------------------------------------------------------------------
seq1000.cbl	The sequential update program presented in figure 13-7 and 
		used by exercises 13-1 and 13-3
seq2000.cbl	The sequential maintenance program presented in figure 13-11
rpt3000.cbl	The customer sales report program with branch totals used by 
		exercise 13-2

--------------------------------------------------------------------------------
Chapter 14
--------------------------------------------------------------------------------
ind1000.cbl	The sequential file creation program presented in figure 14-6 
		and used by exercise 14-1
seq1000.cbl	The sequential update program used by exercise 14-2
rpt3000.cbl	The customer sales report program with branch totals used by 
		exercise 14-3
ind4000.cbl	The customer display program used by exercise 14-4
ind2000.cbl	The random maintenance program presented in figure 14-9

--------------------------------------------------------------------------------
Chapter 15
--------------------------------------------------------------------------------
rel4000.cbl	The relative file creation program used by exercise 15-1

--------------------------------------------------------------------------------
Chapter 16
--------------------------------------------------------------------------------
rpt5000.cbl	The two-level customer sales report program used by exercise 
		16-1
srt1000.cbl	The edit-sort-and-update program presented in figure 16-9

--------------------------------------------------------------------------------
Chapter 17
--------------------------------------------------------------------------------
inq1000.cbl	The inventory inquiry program presented in figure 17-6
mnt1000.cbl	The inventory maintenance program presented in figure 17-12
calc1000.cbl	The calculate sales tax program used by exercise 17-1

--------------------------------------------------------------------------------
Chapter 22
--------------------------------------------------------------------------------
bookinq.cbl	The book inquiry program presented in figure 22-12 and used by 
		exercise 22-1
bookmng.cbl	The book manager class presented in figure 22-13 and used by 
		exercise 22-1
bookfm.cbl	The file manager class presented in figure 22-14 and used by 
		exercise 22-1
bookinv.cbl	The book inventory class presented in figure 22-15 and used by 
		exercise 22-1
bookui.cbl	The user interface class presented in figure 22-16 and used by 
		exercise 22-1


THE DATA FILES

custmast.dat	A sequential file of customer master records used for the 
		various versions of the sales report program presented in the 
		text and exercises

brchmast.dat	A sequential file of branch master records used to add the 
		branch names to the sales report in exercises 10-5 and 13-2

ratetab.dat	A sequential file of insurance rates that's used by exercise 
		10-5

rcttran.dat	A sequential file of receipt transactions that's used by the 
		sequential update program in chapter 13

oldmast.dat	A sequential file of old inventory records that's used by the 
		sequential update program in chapter 13 and the edit-sort-and-
		update program in chapter 16

errtran.dat	A sequential file of error transactions that's used by the 
		sequential update program in chapter 13

mnttran.dat	A sequential file of maintenance transactions that's used by 
		the sequential maintenance program in chapter 13 and the 
		random maintenance program in chapter 14

rcttranl.dat	A line sequential version of the receipt transaction file 
		that's used by the sequential update programs in exercises 13-
		1 and 14-2

oldmastl.dat	A line sequential version of the old master file that's used 
		by the sequential update program in exercise 13-1

errtranl.dat	A line sequential version of the error transaction file that's 
		used by the sequential update program in exercise 13-1

invmast.dat	A sequential file of inventory master records used by the 
		indexed file creation program in chapter 14 and the relative 
		file creation program in exercise 15-1

invmasti.dat	An indexed file of inventory master records used by the random 
		maintenance program in chapter 14, the random update program 
		in exercise 14-2, and the interactive inquiry programs in 
		chapter 17, chapter 22, and exercise 22-1

invmasti.idx	The index for the inventory master file

custmsti.dat	An indexed file of customer master records used by the sales 
		report programs in chapter 14

custmsti.idx	The index for the customer master file

invmastr.dat	A relative file of inventory master records used by the random 
		update program in exercise 15-2

rcttranu.dat	An unsorted version of the receipt transaction file used by 
		the edit-sort-and-update program in chapter 16

custmstu.dat	An unsorted version of the customer master file used by the 
		sales report program in exercise 16-1

stumast.dat	A sequential file of student master records used by some of 
		the student projects

stumastl.dat	A line sequential version of the student master file

stumasti.dat	An indexed file of student master records used by some of the 
		student projects

stumasti.idx	The index for the student master file

crsereg.dat	A sequential file of course registration records used by some 
		of the student projects

crseregl.dat	A line sequential version of the course registration file


THE COPY MEMBERS

stumast.cpy	The record description for the student master file used by 
		some of the student projects

crsereg.cpy	The record description for the course registration file used 
		by some of the student projects

stattbl.cpy	The state table used by some of the student projects

