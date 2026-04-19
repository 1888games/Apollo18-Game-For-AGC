	
DO_TURNS

	CA		TURN_TEN	# Load number of tens in turns left
	EXTEND
	BZF		TENS_ZERO	# Tens is zero, just decrease ones
	
	CA 		TURN_DIG	# Load number of ones in turn count
	EXTEND
	BZF 		WRAP_TEN	# If zero, decrease tens
	
	EXTEND
	DIM		TURN_DIG	# Decrease ones
	
	TCF		DONE_TURNS	# We know tens > 0, skip the rest
	
WRAP_TEN
	
	EXTEND
	DIM		TURN_TEN	# Decrease number of tens
	
	CA		DEC9		# Load 9 into A
	TS		TURN_DIG	# Store into turn ones
	
	TCF 		DONE_TURNS	# We know we can't be out of turns, skip rest
	
TENS_ZERO				

	EXTEND
	DIM		TURN_DIG	# Decrease number in ones	
		
	CA		GM_STATE	# Get game state
	EXTEND
	BZF		NOT_WON		# Still playing	
	
	TCF		IS_GM_OVR	# We won, don't check game over
	
NOT_WON
	CA		TURN_DIG	# Load ones into A
	EXTEND
	BZF 		NONE_LEFT	# If ones is zero
	
	TCF		DONE_TURNS	# Ones > 0, not out of turns
	
NONE_LEFT
	
	CA 		OPP_ERR	 	# Load bit pattern for operator error light
	EXTEND
	WOR		CH11		# Turn bit on
	
	CA 		STALOSE		# Load status id for lost condition
	TS 		GM_STATE	# Store in game state var
	
	CAF 		GM_TIME		# Get timer value to show game over 
	TS 		TIME4		# Set interrupt to fire when timer (counts up) wraps to 0
	
	TC      	RESETALL        # Set all grid items to empty (-1)
	
	CA 		SIGNAL		# Copy correct answer to bottom row
	TS		NUM_10
	
	CA 		SIGNAL1
	TS 		NUM_11

	CA 		SIGNAL2
	TS 		NUM_12

	CA 		SIGNAL3
	TS 		NUM_13

	CA 		SIGNAL4
	TS 		NUM_14
	
	TCF		IS_GM_OVR	# Don't update guess history, who cares, you lost!

DONE_TURNS

	TC		DISP_HIST	# Update guess history	
	
IS_GM_OVR

	TC		DISPALL		# Refresh DSKY
			
	TCF		MAINLOOP	# Return to main loop
	