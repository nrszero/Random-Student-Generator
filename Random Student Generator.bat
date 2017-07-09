::Random Student Generator
::Randomly picks a student from the list
::Version: 1.1
::Date: Oct 30th
::Author: Nathan Schmitt

@echo off
setlocal EnableDelayedExpansion 
color 1F
::Sets the screen size
mode con: cols=120 lines=30

:restart

::Declare Variables and make folders.
::Adjust studentAmount variable for changes
set studentAmount=12
set currentCount=""
if NOT Exist Memory\List md Memory\List

::The List of Students. Name needs to be less than 25 characters
::Supports up to 15 students right now.
set Student[1]=Joseph Austin
set Student[2]=Nathan Gonczy
set Student[3]=Phillip Granley
set Student[4]=Angela Guderjohn
set Student[5]=Jo Harrington
set Student[6]=Ron Houle
set Student[7]=Kathleen Howland
set Student[8]=Gregg Lentz
set Student[9]=Dustin McGee
set Student[10]=Nathan Schmitt
set Student[11]=Chaunzi Segler
set Student[12]=Brandon Villnow

::Extra Students
set Student[13]=
set Student[14]=
set Student[15]=

::Checks if saved progress and changes string1
if Not Exist Memory\count.dat set "string1=Start    "
if Exist Memory\count.dat set "string1=Continue "

::Main prompt when starting the Batch
:Menu
cls
echo.
echo.
echo.
echo.
echo.
echo.                                                                                             
echo                                         ฺออออออออออออออออออออออออออออออออออออฟ
echo                                         ณ                                    ณ
echo                                         ณ      Random Student Generator      ณ
echo                                         ณ                                    ณ
echo                                         ณ             1: %string1%           ณ
echo                                         ณ             2: Exit                ณ
echo                                         ณ                                    ณ 
echo                                         ภออออออออออออออออออออออออออออออออออออู                                                   

choice /n /c 12 > NUL  
if errorlevel 2 (
	call :checkMemory
	call :clearMemory
	exit
)
if errorlevel 1 goto studentLoop

::If they choose start it will bring them here
:studentLoop

::Makes the Random number from 1 to the studentAmount
set /A rand=(%random% %% studentAmount)+1
::set /A rand="6"

::On every pass checks to see if everyone has gone yet.
::Also keeps track of how many people went.
::dir outputs a number of how many files in the dir
dir Memory\List /A /B | Find /V /C "" > Memory\count.dat
set /p currentCount=<Memory\count.dat
if "%currentCount%"=="%studentAmount%" goto end

::Reruns the random number if it has already been used.
::Info stored in Memory\List folder
if Exist Memory\List\%rand%.dat goto studentLoop

call :anim

::Uses the random number to echo to screen name after lenghtCheck.
::Goes to memory label which makes a file used for counting people.
if "%rand%"=="1" (                                                          
call :lenghtCheck                                                 
	goto memory
)
if "%rand%"=="2" (                                                          
call :lenghtCheck                                                    
	goto memory
)
if "%rand%"=="3" (
call :lenghtCheck                                                                                                          
	goto memory
)
if "%rand%"=="4" (
call :lenghtCheck                                                                                                        
	goto memory
)
if "%rand%"=="5" (
call :lenghtCheck                                                                                                              
	goto memory
)
if "%rand%"=="6" (
call :lenghtCheck                                                                                                               
	goto memory
)
if "%rand%"=="7" (
call :lenghtCheck                                                                                                              
	goto memory
)
if "%rand%"=="8" (
call :lenghtCheck                                                                                                             
	goto memory
)
if "%rand%"=="9" (
call :lenghtCheck                                                                                                              
	goto memory
)
if "%rand%"=="10" (
call :lenghtCheck                                                                                                              
	goto memory
)
if "%rand%"=="11" (
call :lenghtCheck                                                           
	goto memory
)
if "%rand%"=="12" (
call :lenghtCheck                                                                                                               
	goto memory
)
if "%rand%"=="13" (
call :lenghtCheck                                                                                                               
	goto memory
)
if "%rand%"=="14" (
call :lenghtCheck                                                                                                               
	goto memory
)
if "%rand%"=="15" (
call :lenghtCheck                                                                                                               
	goto memory
)

::Asks if they should continue to find another student.
:prompt
echo.
echo.
echo.
echo.
echo.
echo.     
echo                                                 1: Select Next Student   
echo                                                 2: Exit Application
echo.
echo                         อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
choice /n /c 12
if errorlevel 2 call :confirm
if errorlevel 1 goto studentLoop

::Keeps track of people that went and stores in Memory\List folder
:memory
if NOT Exist Memory\List md Memory\List 
copy /y NUL Memory\List\%rand%.dat > NUL
goto prompt

::What happens when you run through all students.
:end
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                                                
echo                                           All of the Students have Presented!
echo.                                         
echo                                                   1: Go to Main Menu
echo                                                   2: Exit Application

choice /n /c 12 
if errorlevel 2 (
	call :clearMemory
	exit
) 
if errorlevel 1 (
	call :clearMemory
	goto restart
) 

::Checks if the count.dat is in the folder
::If it doesn't exist it exits.
:checkMemory
if Exist Memory\count.dat (
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                        WARNING
echo.
echo                                               Your last session is saved,
echo                                                       delete it?
echo.
echo                                                         1: Yes
echo                                                         2: No
	choice /n /c 12
	if errorlevel 2 exit
	if errorlevel 1 Exit /B
) 
Exit /B


::Used when needed to clear all files.
:clearMemory
rmdir /S /Q Memory
::del /Q count.dat
exit /B

::Delete files or not.
:confirm
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                                              
echo.
echo.
echo.                                                                              
echo                                          Would you like to save your progress?
echo.                                         
echo                                                         1: Yes
echo                                                         2: No
choice /n /c 12
if errorlevel 2 (
	call :clearMemory
	exit
)
if errorlevel 1 (
	exit
)

::Checks Lenght of Student Variables
:lenghtCheck
Set _str=!Student[%rand%]!

For /l %%g in (0,1,50) do (

REM :~ Expands the str variable
REM Looks for 1 chacacter that begins after %%g 
	Set "_char=!_str:~%%g,1!"
	
REM if _char is empty we are at the end of the string
	if not defined _char (
	set stringLength=%%g
	goto calcSpace	
	)
)

::Takes stringLength variable and subtract from 25 
::25 is how many chacacters to make
::studName variable reach output box
:calcSpace
if NOT "!stringLength!"==25 (
	set /A space=25-!stringLength!
	goto makeSpace
)

:nextUpOutput
echo.
echo.
echo.
echo.
echo.
echo.
echo                                         ฺออออออออออออออออออออออออออออออออออออฟ
echo                                         ณ                                    ณ
echo                                         ณ       The next student is...       ณ
echo                                         ณ                                    ณ
echo                                         ณ           !studName!ณ              
echo                                         ณ                                    ณ
echo                                         ณ                                    ณ
echo                                         ภออออออออออออออออออออออออออออออออออออู

::Brings you back to call :lenghtCheck in studentLoop
Exit /B

::Takes result of calcSpace
::Then add spaces to Student Variable
:makeSpace
if !space!==23 (
	set "studName=!Student[%rand%]!                       "
	goto nextUpOutput
)
if !space!==22 (
	set "studName=!Student[%rand%]!                      "
	goto nextUpOutput
)
if !space!==21 (
	set "studName=!Student[%rand%]!                     "
	goto nextUpOutput
)
if !space!==20 (
	set "studName=!Student[%rand%]!                    "
	goto nextUpOutput
)
if !space!==19 (
	set "studName=!Student[%rand%]!                   "
	goto nextUpOutput
)
if !space!==18 (
	set "studName=!Student[%rand%]!                  "
	goto nextUpOutput
)
if !space!==17 (
	set "studName=!Student[%rand%]!                 "
	goto nextUpOutput
)
if !space!==16 (
	set "studName=!Student[%rand%]!                "
	goto nextUpOutput
)
if !space!==15 (
	set "studName=!Student[%rand%]!               "
	goto nextUpOutput
)
if !space!==14 (
	set "studName=!Student[%rand%]!              "
	goto nextUpOutput
)
if !space!==13 (
	set "studName=!Student[%rand%]!             "
	goto nextUpOutput
)
if !space!==12 (
	set "studName=!Student[%rand%]!            "
	goto nextUpOutput
)
if !space!==11 (
	set "studName=!Student[%rand%]!           "
	goto nextUpOutput
)
if !space!==10 (
	set "studName=!Student[%rand%]!          "
	goto nextUpOutput
)
if !space!==9 (
	set "studName=!Student[%rand%]!         "
	goto nextUpOutput
)
if !space!==8 (
	set "studName=!Student[%rand%]!        "
	goto nextUpOutput
)
if !space!==7 (
	set "studName=!Student[%rand%]!       "
	goto nextUpOutput
)
if !space!==6 (
	set "studName=!Student[%rand%]!      "
	goto nextUpOutput
)

::Loading animation
:anim
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                        
ping -n 1 -w 500 1.1.1.1 > NUL
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                         o
ping -n 1 -w 500 1.1.1.1 > NUL                             
cls                                                        
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo                                                         o o
ping -n 1 -w 500 1.1.1.1 > NUL                             
cls                                                        
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo.                                                      
echo                                                         o o o
ping -n 1 -w 500 1.1.1.1 > NUL                                 
cls
Exit /B



http://ss64.com/nt/syntax-strlen.html
http://stackoverflow.com/questions/3068929/how-to-read-file-contents-into-a-variable-in-a-batch-file
http://www.robvanderwoude.com/shorts.php
http://stackoverflow.com/questions/210201/how-to-create-empty-text-file-from-a-batch-file

