FUNCTION CTRL_IN
    (* calculate the process error DIFF *)
    CTRL_IN := DEAD_ZONE(SET_POINT - ACTUAL, NOISE);


    (* revision history
    hm 	2. jun. 2008 	rev 1.0
    	original version

    *)
END_FUNCTION