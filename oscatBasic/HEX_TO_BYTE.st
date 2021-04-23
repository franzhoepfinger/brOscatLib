FUNCTION HEX_TO_BYTE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=164*)
    pt := ADR(hex);
    stop := LEN(hex);
    FOR I := 1 TO stop DO
    	(* read the first character and subtract 48 to get value in decimal 0 = 48 *)
    	x := pt^;
    	(* calculate the value of the digit *)
    	IF X > 47 AND x < 58 THEN
    		HEX_TO_BYTE := SHL(HEX_TO_BYTE,4) + X - 48;
    	ELSIF X > 64 AND X < 71 THEN
    		HEX_TO_BYTE := SHL(HEX_TO_BYTE,4) + X - 55;
    	ELSIF X > 96 AND X < 103 THEN
    		HEX_TO_BYTE := SHL(HEX_TO_BYTE,4) + X - 87;
    	END_IF
    	pt := pt + 1;
    END_FOR




    (* revision histroy
    hm	18. jun. 2008	rev 1.0
    	original release

    hm	20. sep.2008	rev 1.1
    	changed length of input string from 20 to 5

    *)	

END_FUNCTION