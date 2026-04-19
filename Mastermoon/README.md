# AGC_Blank_Project_Sublime
A skeleton framework for writing a new program/game for the Apollo Guidance Computer. <br />
<br></br>
Using the AGC Assembly package for Sublime Text 4. On pressing F8 to run make.bat it will:

* Kill any running AGC emulator processes ready for new instances
* Copy *.agc assembly files from /scripts folder (and sub-folders) into a flat structure in /bin folder
* Assemble the project using yaYUL to main.bin
* Run main.bin in Virtual AGC emulator

<br></br>
**Setup requirements** </br>
<br></br>   
**1) Copy the /bin and /resources folders from your Virtual AGC installation into the parent folder for all your AGC projects:**

C:\AGC_PROJECTS <br />
      &nbsp;&nbsp;&nbsp;&nbsp;-------bin <br />
      &nbsp;&nbsp;&nbsp;&nbsp;-------resources <br />
      &nbsp;&nbsp;&nbsp;&nbsp;-------AGC_PROJECT_1 <br />
      &nbsp;&nbsp;&nbsp;&nbsp;-------AGC_PROJECT_2 etc <br />
<br></br>    
**2) In make.bat, set the location of the project folder in SRC variable.**
<br></br>
**3) In resources folder, for each project create 2 bat files:**

simulate_yourprojectname2.bat

  ..\bin\WinAGC.exe <simulate_yourprojectname1.bat

simulate_yourprojectname1.bat

  ..\bin\yaAGC --core=" C:\AGC_PROJECTS\AGC_PROJECT_1\bin\Main.bin" --port=19797 --cfg=LM.ini <br />
  ..\bin\yaDSKY2 --cfg=LM.ini --port=19797 <br />
<br></br>
**4) In make.bat, change call simulate_numbers2.bat to simulate_yourprojectname2.bat**
  
