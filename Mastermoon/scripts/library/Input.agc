KEYRUPT1                          # Triggered automatically when a key is pressed

                CA      NOKEY     # Load code for 'NO KEY PRESSED'
                TS      KEYBUF    # Clear key buffer so we don't persist presses from when they are not wanted

                CA      ACTIVE    # Load whether game is active
                EXTEND
                BZF     CANREAD   # If not active, we can accept key press to start the game

                CA      GM_STATE  # Load game state into A
                EXTEND 
                BZF     CANREAD   # If not 'check_key', we don't care about key presses

                TCF     EXITRUPT  # Exit, we're not listening for key presses while processing happens

CANREAD

                EXTEND
                READ    CH15      # Read I/O channel that contains the keycode
                MASK    LOW5      # Retain only lower 5 bits
                TS      KEYBUF    # Store into keyboard buffer variable for main loop to pick up

EXITRUPT
                CA      ZEROES    # Clear the input channel
                EXTEND
                WRITE   CH15

                DXCH      ARUPT   # Restore A, L, and Q, and exit the interrupt
                EXTEND
                QXCH      QRUPT
                RESUME




WAITKEY                                 # Waiting for any key press to start game
                                        # If we didn't wait, the RNG would always start in same state

                CA      NOKEY           # Load key code for 'no key pressed'
                EXTEND
                SU      KEYBUF          # Subtract the key code read
                EXTEND
                BZF     WAITMORE        # If zero, nothing pressed, continue waiting

                CA      NOKEY           # Clear keyboard buffer so not carried into game
                TS      KEYBUF
                
                TCF     NEW_GAME        #Jump to set up new game
                
WAITMORE
                TCF     MAINLOOP




CHECKKEY                                       # Check whether key press in buffer from interrupt

                CA              NOKEY           # Load key code for nothing pressed into A
                XCH             KEYBUF          # Swap A and buffer. A is now key code and buffer is clear.
                INDEX		A               # Index using the keycode
                TCF		KEYTABL         # Into a jump table with jumps for each possible key

                # We ignore all presses except for 2, 4, 6, 8 for game control and ENTER/RESTART to reset game.
KEYTABL
                TCF		ENDKYCK		# unused
                TCF		NUM_PRESS	# 1
                TCF		NUM_PRESS	# 2
                TCF		NUM_PRESS	# 3
                TCF		NUM_PRESS	# 4
                TCF		NUM_PRESS	# 5
                TCF		NUM_PRESS	# 6
                TCF		NUM_PRESS	# 7
                TCF		NUM_PRESS	# 8
                TCF		NUM_PRESS	# 9
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		NUM_PRESS	# 0 - index 16!
                TCF		CLR_DIGIT		# VERB
                TCF		INIT2		# RSET
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# unused
                TCF		ENDKYCK		# KEY REL
                TCF		SCROLL_UP	# +
                TCF		SCROLLDOWN	# -	not sure which way round makes sense yet
                TCF		ENDKYCK		# ENTR
                TCF		ENDKYCK		# unused
                TCF		CLR_DIGIT	# CLR
                TCF		ENDKYCK		# NOUN
                TCF		ENDKYCK		# NOKEY

ENDKYCK
                TCF  MAINLOOP   # When we do nothing, just exit back to main loop to wait for a valid key

