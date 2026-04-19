
NUM_PRESS	

	INDEX 		ENTER_IDX	# Get index of segment to populate next	
	TS		VALUES		# Store key number pressed in array
	
	EXTEND
	SU		ZERO_IDX	# Subtract 16 from key press index
	EXTEND
	BZF		ZERO_PRESS	# If 0, zero key was pressed	
	
	TCF		NOT_ZERO	# Not zero, skip
	
ZERO_PRESS

	CA		ZERO		# Load 0 into A
	INDEX		ENTER_IDX	# Get index of segment to populate
	TS		VALUES		# Override value saved earlier with 0
	
NOT_ZERO
	
	TC		DISPALL		# Need to display all as digits are drawn in pairs	
	INCR		ENTER_IDX	# Move to next index
	
	CA		DEC11		# Load 11 into A
	TS		TEMPI		# Store in temp variable for subtraction
	
	CA		ENTER_IDX	# What's the next index?
	EXTEND	
	SU		TEMPI		# Subtract 11 from it
	EXTEND
	BZF		CHECKNEW	# If A = 0, we entered 5 digits already
	
	TCF		MAINLOOP	# Return to main loop
	
	
CHECKNEW
	
	TC 		STOREGUESS	# Copy guess down to row 2, shift guess history array
	TC 		CHECKGUESS	# Check accuracy of guess
	TCF		DO_TURNS 
	