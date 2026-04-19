UPDATE_WIN

	CA      NOKEY           # Load key code for 'no key pressed'
        EXTEND
        SU      KEYBUF          # Subtract the key code read
        EXTEND
        BZF     NOTYET          # If zero, nothing pressed, continue waiting

        CA      NOKEY           # Clear keyboard buffer so not carried into game
     	TS      KEYBUF
                
        TCF     INIT2        	# Jump to set up new game
                
NOTYET

	TCF	MAINLOOP
	


	