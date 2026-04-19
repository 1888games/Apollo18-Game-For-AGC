NEW_GAME
	
	CA		DEC1		# Load 1 into A (no immediate mode)
	TS		TURN_TEN	# Store as 'tens' digit for turns left
	
	CA		DEC2		# Load 2 into A
	TS		TURN_DIG	# Store as ones (12 turns) - still gives opportunity for people to show off
					# with their number of turns left
	
	CA		DEC16		# Load 16 into A
	TS		ZERO_IDX	# Store in ram to use to check for 0 key press
	
	CA		DEC5		# Load 5 into A
	TS		NUM_WIN		# Correct digits needed to win
	
	CA		ZERO		# Load 0 into A
	TS		RIGHT_TEN	# Set current correct & almost guesses to zero
	TS		ALMOST_TEN
	TS		RIGHT_DIG
	TS		ALMOST_DIG
	TS		HIS_IDX		# Reset scrollable guess history index
	
	CA 		NEG5  		# Load -5
	TS 		MAX_IDX		# Reset maximum scrollable guess history index
	
	CA		DEC6		# Load 6 into A
	TS		ENTER_IDX	# Store as segment for player to populate next
	
	CA		NEG_ONE		# Load -1 into A
	TS		SIGNAL		# Initialise digits to -1 so wont match chosen digit
	TS		SIGNAL1
	TS		SIGNAL2
	TS		SIGNAL3
	TS		SIGNAL4

	
	CA		DEC4 		# Load 4 into A
	TS 		CUR_ID		# Store as id of signal digit to populate  
	
SIG_LOOP				# Loop through each digit to be chosen

	TC 		RANDOM		# Get a random number from 0-9 into A
	TS		TEMPI		# Store in temp var
	
	CA		CUR_ID	 	# Get current digit being chosen
	AD 		DEC1 		# Add 1
	TS 		END_ID		# Store as first id to check against
	
INT_LOOP			        # Loop through the previous chosen digits

	CA		END_ID		# Load id to check against
	EXTEND
	SU		NUM_WIN		# Subtract 5
	EXTEND
	BZF		NO_DUPS		# If we reached id 5, no dups were found
	
	INDEX 		END_ID          # Index by digit id within internal check
	CA		SIGNAL 		# Get number chosen in slot
	
	EXTEND
	SU 		TEMPI	        # Subtract the proposed number for this slot
	EXTEND
	BZF		SIG_LOOP	# Found a dup, try again
	
	INCR		END_ID		# Increase id for dup check
	TCF		INT_LOOP	# Look at next slot

NO_DUPS	

	CA		TEMPI		# Get the chosen number
	INDEX		CUR_ID		# Index by slot to populate
	TS 		SIGNAL 		# Store in the signal array
	
	#INDEX 		CUR_ID		# Index by slot
	#TS 		NUM_10		# Store in DSKY for debugging
	
	CA		CUR_ID		# Get slot index
	EXTEND
	BZF 		PICKED_ALL	# Done slot 0, all picked
	
	EXTEND
	DIM 		CUR_ID	        # Decrement slot id
	
	TCF		SIG_LOOP	# Do next slot
	
PICKED_ALL
		
	TC      	DISPALL         # Display the new game state
	
        CA      	STAINPUT        # Set game state to listen for key presses and respond
        TS      	GM_STATE	
    
CLR_HIS

	CA		HS_LS_IDX	# Get index of last history slot
	TS		CUR_ID		# store in variable
	
CLR_LOOP
	
	CA 		NEG_ONE		# Load -1 into A	
	INDEX		CUR_ID		# Index by current history slot
	TS 		PREV_GUESS	# Store -1 to history array
	
	CA		CUR_ID		# Load current index
	EXTEND
	BZF		CLR_DONE	# If it's 0, we are done
	
	EXTEND
	DIM		CUR_ID		# Decrement current id
	
	CS      	NEWJOB         	# Each loop, nudge hardware watchdog 		
	
	TCF 		CLR_LOOP	# Do next slot in history array
	
CLR_DONE

 
        RELINT                 		# Enable interrupts
        INCR 		FIRST_RUN	# Set flag that game has run once
               
	TCF		MAINLOOP	# Go back to main loop
