FUNCTION F_TO_PT
    F_TO_PT := DWORD_TO_TIME(REAL_TO_DWORD(1.0 / F * 1000.0));


    (* revision history

    hm	4. aug. 2006	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	real constants updated to new systax using dot

    *)

END_FUNCTION