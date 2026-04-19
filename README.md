# Apollo18-Game-For-AGC
A game written in five hours for Ludum Dare 59 in AGC Assembly for the Apollo Guidance Computer

Using the AGC Assembly package for Sublime Text 4 on Windows. On pressing F8 to run make.bat it will:

Kill any running AGC emulator processes ready for new instances
Copy *.agc assembly files from /scripts folder (and sub-folders) into a flat structure in /bin folder
Assemble the project using yaYUL to main.bin
Run main.bin in Virtual AGC emulator

Setup requirements to assemble and run yourself:


Copy the /bin and /resources folders from your Virtual AGC installation into the parent folder for all your AGC projects:

C:\AGC_PROJECTS
    -------bin
    -------resources
    -------Mastermoon

