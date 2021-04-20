FUNCTION DWORD_TO_STRH
    (* read output adress to pointer *)
    pt := ADR(DWORD_TO_STRH) + 8;
    (* wirte the closing byte for the string *)
    pt^:= 0;

    (* write the 8 hex characters backwards *)
    FOR i := 1 TO 8 DO;
    	(* decrement the pointer *)
    	pt := pt - 1;
    	(* read the lowest order hex value *)
    	temp := DWORD_TO_BYTE(in AND 16#0000000F);
    	(* convert value to hex character *)
    	IF temp <= 9 THEN temp := temp + 48; ELSE temp := temp + 55; END_IF
    	(* write character to output string *)
    	PT^ := temp;
    	(* shift in for nect hex character *)
    	in := SHR(in,4);
    END_FOR


    (* code beofre rev 1.2
    FOR i := 1 TO 8 DO
    	X := DWORD_TO_BYTE(in AND 2#1111);
    	IF X <= 9 THEN X := X + 48; ELSE X := X + 55; END_IF
    	Cx := CHR(X);
    	temp := CONCAT(Cx, temp);
    	in := SHR(in,4);
    END_FOR
    DWORD_TO_STRH := temp;
    *)


    (* revision history
    hm	9. jun. 2007	rev 1.0		
    	original version 

    hm	11. sep. 2007	rev 1.1
    	changed coding for compatibility with twincat, concat cannot support a function as an argument.

    hm	15. dec. 2007	rev 1.2
    	changed code for better performance

    hm	29. mar. 2008	rev 1.3
    	changed STRING to STRING(8)

    *)

END_FUNCTION