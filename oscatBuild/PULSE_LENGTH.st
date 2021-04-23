FUNCTION_BLOCK PULSE_LENGTH
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=56*)
    (* read system time *)
    tx := DWORD_TO_TIME(OSCAT_BASIC.T_PLC_MS());

    (* reset outputs, they should only be active 1 cycle *)
    short := FALSE;
    Middle := FALSE;
    long := FALSE;

    (* detect rising edge *)
    IF in AND NOT edge THEN
    	edge := TRUE;
    	tn := tx;

    (* detect for falling edge *)
    ELSIF NOT in AND edge THEN
    	edge := FALSE;
    	tn := tx - tn;
    	IF tn < t_short THEN
    		short := TRUE;
    	ELSIF tn > t_long THEN
    		long := TRUE;
    	ELSE
    		Middle := TRUE;
    	END_IF

    (* generate long pulse as soon as T_long is reached *)
    ELSIF in AND tx - tn > t_long THEN
    	long := TRUE;
    END_IF


    (* revision history

    hm	15. feb 2006	rev 1.0
    	original version

    hm	15 sep 2007		rev 1.1
    	replaced Time() with T_PLC_MS for compatibility and performance reasons

    *)
END_FUNCTION_BLOCK