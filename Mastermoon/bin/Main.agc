
		SETLOC	4000


RESTART
		INHINT			# Turn off interrupts
		CA	O37774		# Schedule the first TIME3 interrupt
                TS	TIME3
		TCF	INIT		# Proceed with initialization
		

$Vectors.agc                            # Add table of interrupt vectors

		# Initialization.
INIT
		CA	ZERO	       # Load 0 to A
		TS      FIRST_RUN      # Store as first run

INIT2	
		CA      ZERO
                EXTEND
                WRITE   CH11           # Clear any DSKY lights

                TC      RESETALL       # Set all grid items to empty (-1)
                TC      DISPALL        # Display the 21 DSKY segments

                CA      NOKEY          # Clear the keypad buffer variable
                TS      KEYBUF         # to initially hold an illegal keycode.
               
                CA      FIRST_RUN      # Is this the first run?
                EXTEND
                BZF     YES_FIRST      # Yes, wait for a key press to start
                
                TCF     NEW_GAME       # No, launch a new game immediately                
YES_FIRST
                
                CA      STAWAIT       # Set game status to listen for key presses
                TS      GM_STATE           
                RELINT

MAINLOOP
                CS      NEWJOB         # Each loop, nudge hardware watchdog


CHKSTATE
	
                INDEX	GM_STATE        # Index into game state jump table
                TCF	STATUSTBL       # Will jump to appropriate function below based on state
STATUSTBL
                TCF	CHECKKEY	# 0 - Listen for keypress and jump to appropriate function
                TCF     WAITKEY         # 1 - Wait for any key press to start game
                TCF	UPDATE_WIN	# 2 - Wait for any key press to restart game
                TCF     MAINLOOP	# 3 - Do nothing
                TCF     INIT2 		# 4 - Start new game
              
# Include the rest of the code modules below


$Grid.agc
$CheckGuess.agc
$NewGame.agc
$NumPress.agc
$UpdateTurn.agc
$WinState.agc
$StoreGuess.agc
$DisplayHistory.agc
$Scroll.agc
$ClearDigit.agc
$Display.agc
$Interrupts.agc
$Input.agc
$Random.agc
$Constants.agc
$Tables.agc
$Ram.agc
