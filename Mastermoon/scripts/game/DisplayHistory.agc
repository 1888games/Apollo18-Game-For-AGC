DISP_HIST

	CA		DEC11		# Load 11 into A
	TS		DES_IDX		# Store as destination index within DSKY array
	
	CA		HIS_IDX		# Load current start history index
	TS		SRC_IDX		# Store as source index within history array
	AD		DEC10		# Add 10
	TS		END_ID		# Store as the end id to check when done
	
DISP_LOOP

	INDEX		SRC_IDX		# Get current source index
	CA		PREV_GUESS	# Get value from guess history
	
	INDEX		DES_IDX		# Get current DSKY dest index
	TS 		VALUES		# Save value to DSKY array
	
	INCR		SRC_IDX		# Increment source index
	INCR		DES_IDX		# Increment dest index
	
	CA		SRC_IDX		# Load source index
	EXTEND	
	SU 		END_ID		# Subtract end id
	EXTEND
	BZF		DIS_DONE	# If zero, finished copying
	
	TCF		DISP_LOOP	# Not done, loop round again
	
	
DIS_DONE
	
	RETURN				# return to caller