FUNCTION_BLOCK FT_DERIV
    (* read system time *)
    tx := T_PLC_US();
    tc := DWORD_TO_REAL(tx - last);
    last := tx;

    (* init on first startup *)
    IF NOT init THEN
    	init := TRUE;
    	old := in;
    ELSIF run AND tc > 0.0 THEN
    	out := (in - old) / tc * 1000000.0 * K;
    	old := in;
    ELSE
    	out := 0.0;
    END_IF



    (*
    hm 3.1.2007			rev 1.1
    	added init code for startup
    	set the default for K to 1

    hm	15. sep 2007	rev 1.2
    	replaced Time() with T_PLC_US for compatibility and performance reasons
    	increased accuracy and work in microseconds internally

    hm 29 oct 2007	rev 1.3
    	prohibit calculation when tx - last = 0 to avoid division by 0 and increase accuracy on fast systems

    hm	6. nov. 2008	rev 1.4
    	improved performance

    hm	11. mar. 2009	rev 1.5
    	inproved code
    *)
END_FUNCTION_BLOCK