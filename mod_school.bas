nomainwin
open "serial.txt" for append as #ser
close #ser
password$="bablu"
fsearch=0
feepaywin=0
open "serial.txt" for input as #ser
if eof(#ser)=-1 then
    snum=1
    open "student data.txt" for append as #in
    close #in
    open "fee data.txt" for append as #in
    close #in
    open "date data.txt" for append as #in
    close #in
    open "time data.txt" for append as #in
    close #in
    snum=1
    close #ser
    goto [sch]
    end if
input #ser,snum
close #ser

[sch]

windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150
button #sch.fee, "Fee Payment", [feemenu], UL, 10, 100
button #sch.search,"Search",[search],UL, 130, 200,150,30
button #sch.addstud, "Add Student Details", [addstud], UL, 130, 230,150,30
button #sch.editstud, "Edit Student Details", [editstud], UL, 130, 260,150,30
button #sch.close, "Tools", [tools], UR,10, 10
button #sch.about,"About Me!",[aboutme],UL,10,10
statictext #sch.1, "Fee Details", 30, 80, 100,15
statictext #sch.2, "Student Details", 170, 180, 100,15

open "School Management" for window as #sch
    print #sch, "font calibri 10"
    print #sch, "trapclose [quit]"
    wait
'.................................
[aboutme]
close #sch

'Form created with the help of Freeform 3 v07-15-08
'Generated on May 27, 2013 at 16:31:44


[setup.aboutme.Window]

    '-----Begin code for #aboutme

    WindowWidth = 360
    WindowHeight = 440
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    statictext #aboutme.statictext1, "I was genuinely developed by",  15,  32, 160,  20
    statictext #aboutme.statictext3, "I was deliberately developed to ",  15,  72, 603,  20
    statictext #aboutme.statictext4, "- resolve few itterative complexities",  75, 132, 202,  20
    statictext #aboutme.statictext5, "- serve the purpose of school management",  75, 112, 224,  20
    statictext #aboutme.statictext6, "Now!!",  15, 152,  32,  20
    statictext #aboutme.statictext7, "I am called BETA version",  55, 172, 134,  20
    statictext #aboutme.statictext9, "Raghuvaran Ch", 180,  32,  93,  20
    statictext #aboutme.statictext10, "Postulation!!",  15, 212,  81,  20
    statictext #aboutme.statictext11, "I would be glad, If you report any bugs",  55, 232, 210,  20
    statictext #aboutme.statictext12, "P.S.",  15, 252,  19,  20
    statictext #aboutme.statictext13, "Feedback at",  55, 272,  65,  20
    statictext #aboutme.statictext14, "ch.raghuvaran@gmail.com", 125, 272, 149,  20
    statictext #aboutme.statictext15, "would be appreciated!", 155, 292, 149,  40
    button #aboutme.button16,"Okay",[aboutmeok], UL, 115, 342, 120,  40

    '-----End GUI objects code

    open "About Me!" for window as #aboutme
    print #aboutme, "font calibri 10"
    print #aboutme.statictext9, "!font calibri 11 bold"
    print #aboutme.statictext14, "!font calibri 10 bold italic"
wait
[aboutmeok]
close #aboutme
goto [sch]
'.................................
[quit]
gosub [quitc]
close #sch
end
[quitc]
confirm "You are about to QUIT?"; ab$
if ab$ <> "yes" then wait
return
'-----------------------------------------------------------------------------------------
[tools]
close #sch
windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150
   button #tools.sync,"Export Excel data file",[syncexcel], UL,  70,  100, 200,  40
   button #tools.button2,"<- Back",[backtools], UL,  20,  20,  60,  25

    open "Tools" for window as #tools
    print #tools, "font calibri 14"
    print #tools.sync, "!font calibri_light 12"
    print #tools.button2, "!font calibri 10"
    wait
[syncexcel]
'kill "studentdata_excel.txt"
run "notepad help.txt"
open "studentdata_excel.txt" for output as #file1
open "student data.txt" for input as #datas
open "fee data.txt" for input as #fee
paid=0
print #file1,"Serial No. ; Name ;Initial ;Class ;Section ;Father Name ;Phone ;Locality ;Annual Fee;Paid ;Balance ;"
for f=1 to (snum-1)
gosub [readfile]
for o=0 to 8 step 1
print #file1,disp$(o);
print #file1," ;";
next o
gosub [readfee]
print #file1,dummy$;
print dummy$
print #file1," "
next f
close #datas
close #fee
close #file1
notice "Student data file is ready to get imported into MS Excel"


[backtools]
close #tools
goto [sch]
'-----------------------------------------------------------------------------------------
[readfee]
for i=0 to 8 step 1
input #fee,fee(i)
if i<>0 and i<>8 then
paid=paid+fee(i)
end if
next i
dummy$=paid;" ;";fee(8);" ;"
return
'-----------------------------------------------------------------------------------------
[password]
prompt "-Enter Password to access-";psw$
if psw$="" then wait
if psw$<>password$ then
confirm "Wrong Password! Try Again!!";dummy$
if dummy$="no" then wait
else
return
end if


'-----------------------------------------------------------------------------------------
[addstud]
gosub [password]
close #sch
windowWidth=1000
windowHeight=600
dim list$(10)
  list1$(0) = "I"
  list1$(1) = "II"
  list1$(2) = "III"
  list1$(3) = "IV"
  list1$(4) = "V"
  list1$(5) = "VI"
  list1$(6) = "VII"
  list1$(7) = "VIII"
  list1$(8) = "IX"
  list1$(9) = "X"

dim listsec$(10)
  listsec1$(0) = "A"
  listsec1$(1) = "B"
  listsec1$(2) = "C"
  listsec1$(3) = "D"

button #addstud.back, "<- Back",[backadd], UL, 10,10
button #addstud.close, "Close", [closeadd], UR,10, 10
statictext #addstud.namet, "Name:",  15,50, 40,15
textbox #addstud.name, 70,45,130,25
statictext #addstud.int, "Initial:",  210,50, 35,15
textbox #addstud.in, 245,45,40,25
statictext #addstud.classt, "Class :",  15,90, 40,15
combobox #addstud.list1, list1$(, [dummy], 70, 85, 50, 25
statictext #addstud.sect, "Sec :",  180,90, 30,15
combobox #addstud.listsec1, listsec1$(, [dummy], 210, 85, 50, 25
statictext #addstud.fnamet, "Father Name:",  15,120, 40,30
textbox #addstud.fname, 70,120,200,25
statictext #addstud.numt, "Phone:",  85,160, 40,15
textbox #addstud.num, 130,155,140,25
statictext #addstud.loct, "Locality:",  75,190, 50,15
textbox #addstud.loc, 130,187,140,25
statictext #addstud.feet, "Annual Fee:      Rs",  15,220, 100,15
textbox #addstud.fee, 115,215,120,25
statictext #addstud.fee1t, "/-",  215, 220, 50, 25
button #addstud.save, "Save", [addsave], UL, 50, 270, 50, 25
button #addstud.save, "Cancel", [backadd], UL, 200, 270, 50, 25

open "Add Student" for window as #addstud
print #addstud, "trapclose [closeadd]"
 print #addstud, "font calibri 10"
wait
'............................................
[closeadd]
gosub [quitc]
close #addstud
wait
[dummy]
wait
[backadd]
close #addstud
goto [sch]
'--------------------------------------------------------------------------
[serial]
open "serial.txt" for input as #ser
input #ser,snum
close #ser
return
'--------------------------------------------------------------------------
[addsave]
open "studenlist.txt" for append as #std
print #addstud.name, "!contents? name$"
print #addstud.in, "!contents? in$"
print #addstud.list1, "contents? class$"
print #addstud.listsec1, "contents? sec$"
print #addstud.fname, "!contents? fname$"
print #addstud.num, "!contents? num$"
print #addstud.loc, "!contents? loc$"
print #addstud.fee, "!contents? fee$"
print #std, "Serial  :";snum
print #std, "Name    :"; name$
print #std, "Initial  :";in$
print #std, "Class   :"; class$
print #std, "Sec     :"; sec$
print #std, "Father"
print #std, "Name    :"; fname$
print #std, "Phone   :"; num$
print #std, "Locality:"; loc$
print #std, "A.fee   :"; fee$
close #std
open "student data.txt" for append as #bab
print #bab,snum
print #bab, name$
print #bab, in$
print #bab, class$
print #bab, sec$
print #bab, fname$
print #bab, num$
print #bab, loc$
print #bab, fee$
close #bab
open "fee data.txt" for append as #bab
gosub [datainitial]
print #bab,fee$
close #bab
open "date data.txt" for append as #bab
gosub [datainitial]
print #bab, "0"
close #bab
open "time data.txt" for append as #bab
gosub [datainitial]
print #bab, "0"
close #bab

notice "Student is added to the List"
notice "Registration number --  :";snum
snum=snum+1
open "serial.txt" for output as #ser
print #ser,snum
close #ser
goto [backadd]

[datainitial]
print #bab,snum
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
return
'-----------------------------------------------------------------------
[feemenu]
close #sch
[feemenuagain]
    '-----Begin code for #feemenu

windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150
 '   UpperLeftX=int((DisplayWidth-WindowWidth)/2)
 '   UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    button #feemenu.button1,"<- Back",[backfeemenu], UL, 10,10
    button #feemenu.button2,"Pay Fee",[feepayment], UL, 60, 100, 200,  40
    button #feemenu.button3,"View Fee details",[viewfee], UL, 60, 150, 200,  40

    '-----End GUI objects code

    open "Fee account" for window as #feemenu
    print #feemenu, "font calibri 10"
    print #feemenu, "trapclose [closefeemenu]"
    wait
[backfeemenu]
close #feemenu
goto [sch]
[closefeemenu]
gosub [quitc]
close#feemenu
wait
'-----------------------------------------------------------------------
[feepayment]
gosub [password]
close #feemenu
fsearch=1
goto [search]
'notice "Under Construction"
wait
'------------------------------------------------------------------------
[editstud]
gosub [password]
close #sch

[edit1]
gosub [serial]
windowWidth=300
windowHeight=80
'dim list23$(10)
  list23$(0) = "I"
  list23$(1) = "II"
  list23$(2) = "III"
  list23$(3) = "IV"
  list23$(4) = "V"
  list23$(5) = "VI"
  list23$(6) = "VII"
  list23$(7) = "VIII"
  list23$(8) = "IX"
  list23$(9) = "X"

'dim listsec23$(4)
  listsec23$(0) = "A"
  listsec23$(1) = "B"
  listsec23$(2) = "C"
  listsec23$(3) = "D"

button #edit1.back, "<- Back", [backedit1],UL,10,10
button #edit1.close, "Close", [closeedit1],UR,30,10,70,25
'statictext #edit1.class, "Class:",10,75,50,15
'combobox #edit1.list23, list23$(), [dummy], 60, 70, 50, 25
'statictext #edit1.listsec23, "Sec:", 180, 75,35,15
'combobox #edit1.listsec23, listsec23$(), [dummy], 220, 70, 50, 25
statictext #edit1.snum1, "Enter Serial number :",10,75,100,20
textbox #edit1.snume1, 115, 70, 50, 25
button #edit1.search, "Search", [editsearch],UL, 50,110,200,50
button #edit1.cancel, "Cancel", [backedit1], UR 30,180,70,25


open "Edit Info" for window as #edit1
print #edit1, "trapclose [closeedit1]"
 print #edit1, "font calibri 10"
wait
'---------------------------------------------------------------------------
[backedit1]
close #edit1
goto [sch]

[closeedit1]
gosub [quitc]
close #edit1
wait
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

[editsearch]

open "student data.txt" for input as #babb
print #edit1.snume1, "!contents? snume$"
e=snum*9
 for i=1 to e
if eof(#babb) then [stopLooping]
line input #babb, line$
 print line$
 if line$=snume$ then [found]
 next i
close #babb


[stopLooping]
notice "Serial number entered is not found!!"
close #babb
wait
'goto [backedit1]

'..........................................................
[found]

windowWidth=1000
windowHeight=600
 UpperLeftX = 400
  UpperLeftY = 150
notice "The serial '";line$;"'is found!!"
for p=1 to 8
line input #babb, line$
disp$(p)=line$
next p
close #babb

statictext #found.namet,"Name:",  15,50, 30,20
statictext #found.name,disp$(1) ,  50,50, 150,40
statictext #found.int,"Initial:",  210,50, 30,20
statictext #found.in,disp$(2) ,  240,50, 150,40
statictext #found.classt,"Class :",  15,80, 40,20
statictext #found.class,disp$(3),  50,80, 30,15
statictext #found.sect, "Sec :",  150,80, 30,20
statictext #found.sec,disp$(4),  200,80, 30,15
statictext #found.fnamet, "Father Name:",  15,110,80,15
statictext #found.fname,disp$(5), 85,110,200,25
statictext #found.numt, "Phone:",  15,140, 35,15
statictext #found.num,disp$(6), 60,140,140,25
statictext #found.loct, "Locality:",  15,170, 50,15
statictext #found.loc,disp$(7), 60,170,140,25
statictext #found.feet, "Annual Fee:   Rs",  15,200, 80,15
statictext #found.fee,disp$(8), 100,200,120,25
statictext #found.fee1t, "/-",  140, 200, 50, 25


button #found.back, "<- Back",[backfound], UL, 10,10
button #found.close, "Close", [closefound], UR,10,10
button #found.edit, "Edit", [edit], LL,60,40,200,50
'button #found.save, "Save", [addsave], UL, 50, 270, 50, 25
'button #found.save, "Cancel", [backadd], UL, 200, 270, 50, 25


open "Student Details" for window as #found
close #edit1
print #found, "trapclose [closefound]"
 print #found, "font calibri 10"
'print #found, "fill red; color blue"
wait

[backfound]
close #found
goto [edit1]

[closefound]
gosub [quitc]
close #found
wait
'...........................................................
[edit]
close #found
windowWidth=1000
windowHeight=600
'dim list$(10)
  list1$(0) = "I"
  list1$(1) = "II"
  list1$(2) = "III"
  list1$(3) = "IV"
  list1$(4) = "V"
  list1$(5) = "VI"
  list1$(6) = "VII"
  list1$(7) = "VIII"
  list1$(8) = "IX"
  list1$(9) = "X"

'dim listsec$(10)
  listsec1$(0) = "A"
  listsec1$(1) = "B"
  listsec1$(2) = "C"
  listsec1$(3) = "D"

button #editlist.back, "<- Back",[backeditlist], UL, 10,10
button #editlist.close, "Close", [closeeditlist], UR,10, 10
statictext #editlist.namet, "Name:",  15,50, 40,15
textbox #editlist.name, 70,45,130,25
statictext #editlist.int, "Initial:",  210,50, 35,15
textbox #editlist.in, 245,45,40,25
statictext #editlist.classt, "Class :",  15,90, 40,15
textbox #editlist.class, 70, 85, 50, 25
statictext #editlist.sect, "Sec :",  180,90, 30,15
textbox #editlist.sec1, 210, 85, 50, 25
statictext #editlist.fnamet, "Father Name:",  15,120, 40,30
textbox #editlist.fname, 70,120,200,25
statictext #editlist.numt, "Phone:",  85,160, 40,15
textbox #editlist.num, 130,155,140,25
statictext #editlist.loct, "Locality:",  75,190, 50,15
textbox #editlist.loc, 130,187,140,25
statictext #editlist.feet, "Annual Fee:      Rs",  15,220, 100,15
textbox #editlist.fee, 115,215,120,25
statictext #editlist.fee1t, "/-",  215, 220, 50, 25
button #editlist.save, "Save", [editsave], UL, 50, 270, 50, 25
button #editlist.save, "Cancel", [backeditlist], UL, 200, 270, 50, 25



open "Add Student" for window as #editlist
print #editlist.name,disp$(1)
print #editlist.in,disp$(2)
print #editlist.class,disp$(3)
print #editlist.sec1,disp$(4)
print #editlist.fname,disp$(5)
print #editlist.num,disp$(6)
print #editlist.loc,disp$(7)
print #editlist.fee,disp$(8)


print #editlist, "trapclose [closeeditlist]"
 print #editlist, "font calibri 10"
wait
'............................................
[closeeditlist]
gosub [quitc]
close #editlist
wait

[backeditlist]
close #editlist
goto [edit1]

'............................................
[editsave]
print #editlist.name, "!contents? name$"
print #editlist.in, "!contents? in$"
print #editlist.class, "!contents? class1$"
print #editlist.sec1, "!contents? sec1$"
print #editlist.fname, "!contents? fname$"
print #editlist.num, "!contents? num$"
print #editlist.loc, "!contents? loc$"
print #editlist.fee, "!contents? fee$"

open "student data new.txt" for append as #new
open "student data.txt" for input as #babb
e=(snum-1)*9
 for i=1 to e
if eof(#babb) then [error]
line input #babb, line$
 print #new,line$
 if line$=snume$ then gosub[replace]
 next i


[error]
close #babb
close #new
i=i-1
if i<>e then notice "Error occured. Data not saved!"
if i=e then goto [successedit]
wait


[replace]
i=i+8
print #new, name$
print #new, in$
print #new, class1$
print #new, sec1$
print #new, fname$
print #new, num$
print #new, loc$
print #new, fee$
for o=1 to 8
line input #babb,line$
next o
return

[successedit]
confirm "Save the changes?"; ab$
if ab$ <> "yes" then wait
  kill "student data.txt"
  name "student data new.txt" as "student data.txt"
notice "New file successfully created!!"
goto [backeditlist]
'----------------------------------------------------------------------
[search]
if fsearch=1 then goto [feeagain]
close #sch
[feeagain]
windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150

button #search.back, "<- Back", [backsearch],UL,10,10
button #search.close, "Close", [closesearch],UR,30,10,70,25

statictext #search.namet, "Enter Name :",10,75,75,20
textbox #search.name, 90, 70, 150, 25
button #search.search, "Search", [namesearch],UL, 50,110,200,50
button #search.cancel, "Cancel", [backsearch], UR 30,180,70,25

if fsearch=1 then
open "Fee payment" for window as #search
else
open "Search" for window as #search
end if
print #search, "trapclose [closesearch]"
 print #search, "font calibri 10"
wait

[backsearch]
close #search
goto [sch]

[closesearch]
gosub [quitc]
close #search
wait
'///////////////////////////////////////////////////////////////////
[namesearch]
print #search.name, "!contents? sname$"
sname$ = upper$(sname$)
open "student data.txt" for input as #datas
m=0
for i=1 to (snum-1)
if eof(#datas) then [error1]
gosub [readfile]
dum$= upper$(disp$(1))
if instr(dum$, sname$) > 0 then gosub [sresult]
next i
if m>1 then goto [dispresult]
if m=1 then
t=1
goto [disp]
end if


[error1]
close #datas
notice "Name not found in the list!"
wait

[sresult]
m=m+1                                    'number of multiple matches found = m
smat$(m)=disp$(0)
nmat$(m)=disp$(1)
imat$(m)=disp$(2)
cmat$(m)=disp$(3)
semat$(m)=disp$(4)
fmat$(m)=disp$(5)
pmat$(m)=disp$(6)
lmat$(m)=disp$(7)
femat$(m)=disp$(8)
return

'//////////////////////////////////////////////////////////
[dispresult]'multiple match display
windowWidth=500
windowHeight=160
for y=1 to m
matlist$(y)=nmat$(y);"          ";imat$(y);"       |    ";cmat$(y);"               ";semat$(y)
next y
listbox #dispresult.box,matlist$(),[selected],10, 40, 250, 160
statictext #dispresult.help,"*Select one of the above",5,210,200,15
statictext #dispresult.legend,"   Name   |    Initial      |    Class   |   Sec",5,20,240,15
open "Search Results" for window as #dispresult
Print #dispresult.box, "singleclickselect"
 print #dispresult, "font calibri 10"
wait

[selected]
print #dispresult.box,"selection?"
Input #dispresult.box, stry$
for y=1 to m
if stry$=matlist$(y) then t=y
next y
[disp]'single match display
disp$(0)=smat$(t)
disp$(1)=nmat$(t)
disp$(2)=imat$(t)
disp$(3)=cmat$(t)
disp$(4)=semat$(t)
disp$(5)=fmat$(t)
disp$(6)=pmat$(t)
disp$(7)=lmat$(t)
disp$(8)=femat$(t)
'//////////////////////////////////////////////////////////////////////

[matched]
close #datas
'if m=1 then notice "Name found!!"
if m<>1 then close #dispresult
close #search
gosub [display]

[display]
if fsearch=2 then goto [feeviewwin]
windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150

if fsearch=1 then
button #display.ok,"Pay Fee",[feepay],LL,60,40,200,50
else
button #display.ok,"OK",[closedisplay],LL,60,40,200,50
end if
statictext #display.st,"Serial:",  15,20, 40,25
statictext #display.s,disp$(0) ,  70,20, 150,40

statictext #display.namet,"Name:",  15,50, 50,25
statictext #display.name,disp$(1) ,  70,50, 150,15
statictext #display.namet,"Initial:",  210,50, 50,15
statictext #display.name,disp$(2) ,  260,50, 150,15
statictext #display.classt,"Class :",  15,80, 30,15
statictext #display.class,disp$(3),  70,80, 30,15
statictext #display.sect, "Sec :",  150,80,20,15
statictext #display.sec,disp$(4),  200,80, 30,25
statictext #display.fnamet, "Father Name:",  15,110,150,15
statictext #display.fname,disp$(5), 100,110,200,25
statictext #display.numt, "Phone:",  15,140, 150,15
statictext #display.num,disp$(6), 100,140,140,25
statictext #display.loct, "Locality:",  15,170, 50,15
statictext #display.loc,disp$(7), 100,170,140,15
if fsearch=1 then
statictext #display.feet, "Annual Fee:   Rs",  15,200, 80,15
statictext #display.fee,disp$(8), 100,200,120,25
statictext #display.fee1t, "/-",  140, 200, 50, 25

end if
open "Display" for window as #display
print #display, "trapclose [closedisplay]"
 print #display, "font calibri 10"
wait


[readfile]
for o=0 to 8 step 1
line input #datas,disp$(o)
next o
return

[closedisplay]
close #display
goto [sch]
wait
'-------------------------------------------------------------------------------------
function timecov$(tim)
    h=int(tim/3600)
    tim=tim-h*3600
    m=int(tim/60)
    tim=tim-m*60
    s=int(tim)
    t$=h;":";m;":";s
    timecov$=t$
    end function

'-------------------------------------------------------------------------------------
[feepay]
close #display

[feeviewwin]
fsnum=eval(disp$(0))
total=eval(disp$(8))
open "fee data.txt" for input as #fee
open "date data.txt" for input as #dat
open "time data.txt" for input as #tim
print "fee data txt"
for i=1 to snum-1 step 1
for p=0 to 8 step 1
input #fee,amt(p)
input #dat,d(p)
input #tim,t(p)
next p
if amt(0)=fsnum then goto [feepaywin]
next i
notice "Error occured in fetching FEE DATA FILE"

[feepaywin]
close #fee
close #dat
close #tim
paid=0
for p=1 to 7
paid=paid+amt(p)
next p
balance=total-paid




    WindowWidth = 550
    WindowHeight = 410
'    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
'    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    statictext #feepay.statictext2, "Serial :",  35,  32,  38,  20
    statictext #feepay.statictext3, disp$(0),  95,  32,  99,  20
    statictext #feepay.statictext4, "Name :",  35,  52,  37,  20
    statictext #feepay.statictext5, disp$(1),  95,  52,  90,  20
    statictext #feepay.statictext6, "Class :",  35,  72,  36,  20
    statictext #feepay.statictext7, "Sec :", 155,  72,  24,  20
    statictext #feepay.statictext8, "Father name :",  35,  92,  90,  20
    statictext #feepay.statictext9, disp$(3),  95,  72,   7,  20
    statictext #feepay.statictext10, disp$(4), 195,  72,   7,  20
    statictext #feepay.statictext11, disp$(5), 135,  92,  99,  20
    statictext #feepay.statictext12, "Phone :",  35, 112,  40,  20
    statictext #feepay.statictext13, "Locality :",  35, 132,  49,  20
    statictext #feepay.statictext14, "Anual Fee :",  35, 152,  59,  20

    statictext #feepay.statictext15, "Balance :", 275, 252,  50,  20
    statictext #feepay.statictext16, disp$(6), 135, 112,  63,  20
    statictext #feepay.statictext17, disp$(7), 135, 132,  71,  20
    statictext #feepay.statictext18, disp$(8), 135, 152,  42,  20
    statictext #feepay.statictext19, str$(balance),  375, 252,  42,  20
    statictext #feepay.statictext20, "Payment History :", 275,  32,  96,  20
    statictext #feepay.statictext21, "|", 255,  52,   6,  20
    statictext #feepay.statictext21, "|", 255,  72,   6,  20
    statictext #feepay.statictext22, "|", 255,  92,   6,  20
    statictext #feepay.statictext23, "|", 255, 112,   6,  20
    statictext #feepay.statictext24, "|", 255, 132,   6,  20
    statictext #feepay.statictext25, "|", 255, 152,   6,  20
    statictext #feepay.statictext26, "|", 255, 172,   6,  20
    statictext #feepay.statictext27, "|", 255, 192,   6,  20
    statictext #feepay.statictext29, "Installment 1 :", 275,  52,  79,  20
    statictext #feepay.statictext30, str$(amt(1)), 375,  52,  28,  20

    if amt(1)=0 then
    in=2
    goto [skip]
    end if
    statictext #feepay.statictext30, "Installment 2 :", 275,  72,  79,  20
     statictext #feepay.statictext40, str$(amt(2)), 375,  72,  28,  20
            statictext #feepay.statictext58,date$(d(1)), 415,  52,  52,  20
    statictext #feepay.statictext59, timecov$(t(1)), 495,  52,  35,  20

      if amt(2)=0 then
      in=3
      goto [skip]
      end if
    statictext #feepay.statictext31, "Installment 3 :", 275,  92,  79,  20
        statictext #feepay.statictext41, str$(amt(3)), 375,  92,  28,  20
                 statictext #feepay.statictext60, date$(d(2)), 415,  72,  52,  20
    statictext #feepay.statictext71, timecov$(t(2)), 495,  72,  31,  20

         if amt(3)=0 then
         in=4
         goto [skip]
         end if
    statictext #feepay.statictext32, "Installment 4 :", 275, 112,  79,  20
        statictext #feepay.statictext42, str$(amt(4)), 375, 112,  28,  20
                    statictext #feepay.statictext61,date$(d(3)), 415,  92,  52,  20
    statictext #feepay.statictext62, timecov$(t(3)), 495,  92,  31,  20

         if amt(4)=0 then
         in=5
         goto [skip]
         end if
    statictext #feepay.statictext33, "Installment 5 :", 275, 132,  79,  20
        statictext #feepay.statictext43,str$(amt(5)), 375, 132,  28,  20
            statictext #feepay.statictext63, date$(d(4)), 415, 112,  52,  20
    statictext #feepay.statictext64,timecov$(t(4)), 495, 112,  31,  20

         if amt(5)=0 then
         in=6
         goto [skip]
         end if
    statictext #feepay.statictext34, "Installment 6 :", 275, 152,  79,  20
        statictext #feepay.statictext44, str$(amt(6)), 375, 152,  28,  20
            statictext #feepay.statictext65,date$(d(5)), 415, 132,  52,  20
    statictext #feepay.statictext66, timecov$(t(5)), 495, 132,  31,  20

         if amt(6)=0 then
         in=7
         goto [skip]
         end if
    statictext #feepay.statictext35, "Installment 7 :", 275, 172,  79,  20
        statictext #feepay.statictext45, str$(amt(7)), 375, 172,  28,  20
            statictext #feepay.statictext67, date$(d(6)), 415, 152,  52,  20
    statictext #feepay.statictext68,timecov$(t(6)), 495, 152,  35,  20
        if amt(7)=0 then
        in=8
        goto [skip]
        end if
    statictext #feepay.statictext69, date$(d(7)), 415, 172,  52,  20
    statictext #feepay.statictext70, timecov$(t(7)), 495, 172,  35,  20
'   statictext #feepay.statictext36, "Installment 8 :", 275, 192,  79,  20
'     statictext #feepay.statictext46, "amt1", 375, 192,  28,  20
      [skip]
    statictext #feepay.statictext38, "Paid Amount :", 275, 232,  76,  20
    statictext #feepay.statictext39, "------------------------------------------", 275, 212,  32,  20
    statictext #feepay.statictext47, str$(paid), 375, 232,  30,  20
    if fsearch=2 then
        button #feepay.button54,"OK",[feeviewok], UL, 155, 292, 180,  40
        else
        button #feepay.button48,"Pay",[pay], UL,  95, 292, 140,  40
        button #feepay.button49,"Cancel",[closefeepay], UL, 275, 292, 140,  40
        statictext #feepay.statictext50, "Enter Installment ";in-1;":",  35, 212, 130,  20
        TextboxColor$ = "white"
        textbox #feepay.payment, 115, 232, 100,  25
        end if
    statictext #feepay.statictext52, "Initial :", 135,  32,  40,  20
    statictext #feepay.statictext53, disp$(2), 195,  32,  18,  20
    statictext #feepay.statictext54, "Rs.", 115, 152,  16,  20
    statictext #feepay.statictext55, "Rs.", 355, 232,  16,  20
     statictext #feepay.statictext72, "Rs.", 355, 252,  16,  20
    statictext #feepay.statictext56, "Date", 435,  32,  25,  20
    statictext #feepay.statictext57, "Time", 495,  32,  26,  20



    '-----End GUI objects code

    open "Fee Payment" for window as #feepay
    print #feepay, "font calibri 10"
    print #feepay, "trapclose [closefeepay]"
    wait

[closefeepay]
gosub [quitc]
close #feepay
goto [sch]


[pay]
print #feepay.payment, "!contents? pay$"
amt(in-1)=eval(pay$)
d(in-1)=date$("days")
t(in-1)=time$("seconds")
print "d(";in-1;")=";d(in-1)
print "t(";in-1;")=";t(in-1)

for p=1 to 7
paid=paid+amt(p)
next p
balance=total-paid
amt(8)=balance



open "fee data.txt" for input as #in
open "date data.txt"for input as #dat
open "time data.txt" for input as #tim
open "fee data2.txt" for output as #ot
open "date data2.txt" for output as#datot
open "time data2.txt" for output as #timot
for i=1 to fsnum-1
for o=0 to 8 step 1
line input #dat,da$
line input #in, in$
line input #tim,tim$
print #ot,in$ 
print #datot,da$
print #timot,tim$
next o
next i


for o=0 to 8 step 1
print #ot, amt(o)
print #datot,d(o)
print #timot,t(o)
next o
for o=0 to 8 step 1
line input #in,line$
line input #dat,linedat$
line input #tim,linetim$
next o

for i=fsnum+1 to snum-1
for o=0 to 8 step 1
line input #in, in$
line input #dat,da$
line input #tim,tim$
print #ot,in$ 
print #datot,da$
print #timot,tim$
next o
next i

close #in
close #ot
close #dat
close #datot
close #tim
close #timot
dummy$="Your're Paying Rs.";amt(in-1);" and Balance is Rs.";amt(8)
confirm dummy$; ab$
if ab$ <> "yes" then wait
  kill "date data.txt"
  name "date data2.txt" as "date data.txt"
  kill "time data.txt"
  name "time data2.txt" as "time data.txt"
  kill "fee data.txt"
  name "fee data2.txt" as "fee data.txt"



notice "Your transaction is successful!!"
close #feepay
confirm "Do want to make a new Payment?";ab$
if ab$="yes" then
fsearch=1
goto [feeagain]
end if
goto [sch]
'-----------------------------------------------------------------------------
[viewfee]
fsearch=2
close #feemenu
goto [feeagain]

[feeviewok]
close #feepay
goto [feemenuagain]

'-----------------------------------------------------------------------------

