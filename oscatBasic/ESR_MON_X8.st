FUNCTION_BLOCK ESR_MON_X8
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=36*)
    (* read system timer *)
    tx := DWORD_TO_TIME(T_PLC_MS());

    ESR_Flag := FALSE;
    esr_out[3].typ := 0;
    esr_out[2].typ := 0;
    esr_out[1].typ := 0;
    esr_out[0].typ := 0;
    cnt := 0;


    (* check if inputs have chaged and fill buffer *)
    IF s0 <> X0 AND ((s0 < 100) OR (S0 > 99 AND S0 < 200 AND mode >= 2) OR (S0 > 199 AND mode = 3)) THEN
    	esr_out[cnt] := status_to_ESR(s0, a0, DT_in, TX);
    	X0 := S0;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF s1 <> X1 AND ((s1 < 100) OR (S1 > 99 AND S1 < 200 AND mode >= 2) OR (S1 > 199 AND mode = 3)) THEN
    	esr_out[cnt] := status_to_ESR(s1, a1, DT_in, TX);
    	X1 := S1;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF s2 <> X2 AND ((s2 < 100) OR (S2 > 99 AND S2 < 200 AND mode >= 2) OR (S2 > 199 AND mode = 3)) THEN
    	esr_out[cnt] := status_to_ESR(s2, a2, DT_in, TX);
    	X2 := S2;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF s3 <> X3 AND ((s3 < 100) OR (S3 > 99 AND S3 < 200 AND mode >= 2) OR (S3 > 199 AND mode = 3)) THEN
    	esr_out[cnt] := status_to_ESR(s3, a3, DT_in, TX);
    	X3 := S3;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF cnt < 4 AND s4 <> X4 AND ((s4 < 100) OR (S4 > 99 AND S4 < 200 AND mode >= 2) OR (S4 > 199 AND mode = 3)) THEN
    	esr_out[cnt] := status_to_ESR(s4, a4, DT_in, TX);
    	X4 := S4;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF cnt < 4 AND s5 <> X5 AND ((s5 < 100) OR (S5 > 99 AND S5 < 200 AND mode >= 2) OR (S5 > 199 AND mode = 3)) THEN
    	esr_out[cnt] := status_to_ESR(s5, a5, DT_in, TX);
    	X5 := S5;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF cnt < 4 AND s6 <> X6 AND ((s6 < 100) OR (S6 > 99 AND S6 < 200 AND mode >= 2) OR (S6 > 199 AND mode = 3)) THEN
    	esr_out[cnt] := status_to_ESR(s6, a6, DT_in, TX);
    	X6 := S6;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF
    IF cnt < 4 AND s7 <> X7 AND ((s7 < 100) OR (S7 > 99 AND S7 < 200 AND mode >= 2) OR (S7 > 199 AND mode = 3)) THEN
    	esr_out[cnt] := status_to_ESR(s7, a7, DT_in, TX);
    	X7 := S7;
    	cnt := cnt + 1;
    	esr_flag := TRUE;
    END_IF


    (* revision history
    hm	26. jan 2007		rev 1.0
    	original version

    hm	17. sep 2007	rev 1.1
    	replaced time() with T_PLC_MS() for compatibility reasons

    hm	1. dec. 2009	rev 1.2
    	changed esr_out to be I/O


    *)
END_FUNCTION_BLOCK