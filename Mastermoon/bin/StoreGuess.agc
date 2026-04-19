STOREGUESS
	
	CA		DEC6		# Load 6 into A
	TS		ENTER_IDX	# Store as segment for player to populate next

	CA		CP_ST_IDX	# Load index to start from
	TS		SRC_IDX		# Store into source index variable
	
	AD		DEC5		# Add 5
	TS		DES_IDX		# Store in destination index variable
	
	CA 		MAX_IDX		# Load current max history index
	AD 		DEC5	        # Increase by 5
	TS 		MAX_IDX 	# Store back in memory
	
	CA 		ZERO		# Load 0 into A
	TS		HIS_IDX	        # Reset a previous scrolled list
	
COPY_LOOP
	

	INDEX		SRC_IDX		# Index using source
	CA		PREV_GUESS	# Get value from array
	
	INDEX		DES_IDX		# Index using destination
	TS		PREV_GUESS	# Store value into array
	
	CA		SRC_IDX		# Load index just copied
	EXTEND
	BZF		COPY_DONE	# If it's zero, we're done	

	EXTEND
	DIM		SRC_IDX		# Reduce source index by 1
	
	EXTEND
	DIM		DES_IDX		# Reduce dest index by 1
	
	TCF		COPY_LOOP	# Keep going

COPY_DONE

	CA		NUM_GRID	# Copy guess in row 1 into prev guess history slot 0
	TS 		PREV_GUESS
	TS 		CHK_GRID        # and to row below of DSKY
	
	CA		NUM_1	# Copy guess in row 1 into prev guess history slot 0
	TS 		PREV_1	
	TS   		NUM_6    # and to row below of DSKY
	
	CA		NUM_2	# Copy guess in row 1 into prev guess history slot 0
	TS 		PREV_2	
	TS 		NUM_7 		# and to row below of DSKY
	
	CA		NUM_3	# Copy guess in row 1 into prev guess history slot 0
	TS 		PREV_3
	TS 		NUM_8		 # and to row below of DSKY
	
	CA		NUM_4	# Copy guess in row 1 into prev guess history slot 0
	TS 		PREV_4	
	TS 		NUM_9	 # and to row below of DSKY
	
CLEARGUESS
	
	CA		NEG_ONE
	TS		NUM_GRID
	TS		NUM_1
	TS		NUM_2
	TS		NUM_3
	TS		NUM_4
	
	RETURN
	