SCROLL_UP
	
	CA		HIS_IDX		# Load current start index
	EXTEND
	SU 		MAX_IDX		# Subtract maximum
	EXTEND
	BZF 		CANTSCROLL	# If 0, already at max, don't scroll
	
	CA  		HIS_IDX		# Load start index again
	AD  		DEC5 		# Add five to move to next row
	TS  		HIS_IDX 	# Store back in history index
	
SCR_UPDT

	TC		DISP_HIST	# Update guess history	
	TC  		CHECKGUESS	# Check if middle row matches 
	TC		DISPALL		# Refresh DSKY	
	
	TCF		MAINLOOP 
	
	
CANTSCROLL	
		
	TCF		MAINLOOP
	
	
SCROLLDOWN
		
	CA  		DEC5		# Load 5 into A
	TS 		TEMPI		# Store in temp var
	
	CA 		HIS_IDX		# Load current start index
	EXTEND
	BZF 		CANTSCROLL	# If history index = 0, can't scroll
	
	EXTEND
	SU 		TEMPI 		# Subtract 5 to move to prev row - can't use constant from fixed mem for SU
	TS 		HIS_IDX		# Store back in history index var
	
	TCF		SCR_UPDT	# Update display with scrolled data