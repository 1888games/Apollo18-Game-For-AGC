
            	BLOCK   02
T3RUPT
            	CAF     O37774      # Schedule another TIME3 interrupt
            	TS      TIME3       # ... and don't do anything else, yet...

            	INCR    COUNTER     # Increment counter for random number generation

RESUME      	DXCH    ARUPT       # Restore A, L, and Q, and exit the interrupt
            	EXTEND
            	QXCH    QRUPT
            	RESUME


T4RUPT		

		CA      DEC1	     # Load 1 into A
		TS      TIME4 	     # Set timer so it will take ages to fire again
			
		CA      STALOSE	     # Load lose status id into A
		TS      TEMPI	     # Store in temp var
			
		CA 	GM_STATE     # Load current game state
		EXTEND
		SU 	TEMPI	     # Subtract lose status
		EXTEND
		BZF     DID_LOSE     # If A = 0, we did lose
		
		TCF 	RESUME	     # Timer triggered elsewhere, forget about it
		
DID_LOSE	

		CA 	STAINIT	     # Get status id to fire init on next loop
		TS 	GM_STATE     # Store as game state
		
		TCF  	RESUME	     # Jump to code to return from interrupt