
CHECKGUESS				# Player entered 5 digits, check against signal
	
	# better idea - check against the middle row, display correct/almost values
	# so will need to copy guess down to middle row FIRST
	# recalculate any time the guess displayed in middle row changes

	
	CA		DEC11		# Load 11 into A
	TS 		CHECK_IDX	# Store as segment to check guess against signal
	
	CA		DEC5		# Load 5 into A
	TS		END_ID		# Store to check against digit check index
	
	CA		ZERO		# Load 0 into A
	TS		CUR_ID	  	# Index to compare values
	TS		RIGHT_TMP	# Number correct in right spot
	TS		ALMOST_TMP	# Number correct in wrong spot

CHK_LOOP

	INDEX		CUR_ID		# Load current index value
	CA		CHK_GRID	# Get player's guess in this slot	
	TS		GUESS_NOW	# Store in ram
	
	INDEX		CUR_ID		# Load index again
	CA		SIGNAL		# Get signal num in this slot
	TS		SIG_NOW		# Store in ram
	
	
	EXTEND
	SU		GUESS_NOW	# Subtract guess from signal
	EXTEND
	BZF		IS_RIGHT	# If guess-signal=0, must be right
	
	
CHK_CNT
	# Check count of guess in other segments
	
	CA		ZERO		# Load 0 into A
	TS		ALM_ID		# Segment id to check versus guess
	
SEG_LOOP

	CA		ALM_ID 		# Load current segment id
	EXTEND
	SU		CUR_ID		# Subtract the guess index
	EXTEND
	BZF		END_SLOOP	# If they are the same, don't check
	
	INDEX		ALM_ID		# Index using segment id
	CA		SIGNAL 		# Get the signal num in other slot
	
	EXTEND		
	SU		GUESS_NOW	# Subtract the guess in main slot
	EXTEND
	BZF		IS_ALMOST	# If result = 0, it matches
	
	TCF		END_SLOOP	# They don't match, move to next segment

IS_ALMOST
	
	INCR		ALMOST_TMP	# Increase count of correct num in wrong slot
	TCF		ENDLOOP1	# We found one match, stop checking the rest

END_SLOOP

	INCR		ALM_ID		# Increase index of internal loop
	CA		ALM_ID		# Load index into a
	
	EXTEND
	SU		END_ID	 	# Subtract 5
	EXTEND
	BZF 		ENDLOOP1	# If index = 5, we are done
	
	TCF 		SEG_LOOP	# Not yet 5, loop back and check next digit (segment, slot, number, any others!??)

	
IS_RIGHT

	INCR		RIGHT_TMP	# Increase count of correct numbers
	
ENDLOOP1
	
	INCR		CUR_ID		# Increase index of digit to check
	CA		CUR_ID		# Load new index
	EXTEND
	SU		END_ID		# Subtract 5
	EXTEND
	BZF		ALL5_CHK	# If next digit is 5
	
	CS      	NEWJOB         # Each loop, nudge hardware watchdog - prob not this
	
	TCF		CHK_LOOP	# Not yet, do next digit

ALL5_CHK
	
	CA		RIGHT_TMP	# Load number correct
	TS		RIGHT_DIG 	# Store in DSKY digit
	
	EXTEND
	SU		NUM_WIN		# Subtract 5
	EXTEND
	BZF		DID_WIN		# if result = 0 then we won
	
	TCF		NO_WIN		# no, we didn't win yet
	
	
DID_WIN
	
	# Do something here - flash all the lights?
	# For now the game will stop accepting input
	
	CA		STAWIN		# Load win state id into A
	TS 		GM_STATE	# Store as new state
	
	CA              S77777		# Load constant with all bits set
	EXTEND
	WRITE		CH11		# Output to IO channel, that'll do!
	
	CA		CHK_GRID	# Copy middle row to other rows
	TS		NUM_GRID
	TS 		NUM_10
	
	CA		NUM_6
	TS		NUM_11
	TS 		NUM_1
	
	CA		NUM_7
	TS		NUM_12
	TS 		NUM_2
	
	CA		NUM_8
	TS		NUM_13
	TS 		NUM_3
	
	CA		NUM_9
	TS		NUM_14
	TS 		NUM_4
	
	
NO_WIN
	
	CA		ALMOST_TMP	# Load number in wrong slot
	TS		ALMOST_DIG	# Store in DSKY digit
	
	RETURN
				
	