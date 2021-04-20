FUNCTION_BLOCK M_TX
    (* check FOR rst input *)
    IF rst OR (et >= tmax) THEN
    	rise := FALSE;
    	fall := FALSE;
    	startup := FALSE;
    	th := t#0ms;
    	tl := t#0ms;
    	DC := 0.0;
    	F := 0.0;
    	ET := t#0s;
    END_IF

    (* avoid timers to start when input is true at startup *)
    IF NOT startup THEN
    	edge := in;
    	startup := TRUE;
    END_IF

    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    (* edge trigger rising and falling edge *)
    IF in XOR edge THEN
    	edge := in;
    	(* rising edge starts measurement *)
    	IF in THEN
    		start := Tx;
    		rise := TRUE;
    		IF fall THEN tl := start - stop; END_IF
    		IF th > t#0ms AND tl > t#0ms THEN
    			dc := TIME_TO_REAL(th) / TIME_TO_REAL(th+tl);
    			f := 1000.0 / TIME_TO_REAL(th + tl);
    		END_IF
    	(* falling edge starts second cycle measurement *)
    	ELSE
    		stop := Tx;
    		fall := TRUE;
    		IF rise THEN th := stop - start; END_IF
    		IF th > t#0ms AND tl > t#0ms THEN
    			dc := TIME_TO_REAL(th) /  TIME_TO_REAL(th+tl);
    			f := 1000.0 / TIME_TO_REAL(th + tl);
    		END_IF
    	END_IF
    END_IF
    IF rise THEN et := tx - start; END_IF

    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	2. mai. 2007	rev 1.1
    	made sure that no undefined values would be measured at startup conditions
    	added output et
    	added rst input
    	added tmax input

    hm	16. sep. 2007	rev 1.2
    	changes time() to T_plc_ms() for compatibility reasons

    hm	27. feb. 2009	rev 1.3
    	deleted unnecessary init with 0

    hm	11. mar. 2009	rev 1.4
    	changed real constants to use dot syntax

    *)
END_FUNCTION_BLOCK