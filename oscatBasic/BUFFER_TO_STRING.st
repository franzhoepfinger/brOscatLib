FUNCTION BUFFER_TO_STRING
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=482*)
    ps := ADR(BUFFER_TO_STRING);
    IF size = 0 THEN RETURN; END_IF
    sta := MIN(start, size -1);
    stp := MIN(stop, size -1);

    (* check for maximum string_length *)
    IF UINT_TO_INT(stp - sta + 1) >= STRING_LENGTH THEN
    	stp := sta + INT_TO_UINT(STRING_LENGTH) - 1;
    END_IF

    FOR i := sta TO stp DO
    	ps^ := pt^[i];
    	ps := ps + 1;
    END_FOR

    (* terminate the string *)

    ps^ := 0;



    (* revision History
    hm 	5. mar. 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	changed type of input size to uint

    hm	13. may. 2008	rev 1.2
    	changed type of pointer to array[0..32767]
    	changed size of string to STRING_LENGTH

    hm	12. jun. 2008	rev 1.3
    	check for pointer overrun
    	change input start and stop to uint
    	added type conversions to avoid warnings under codesys 3.0

    hm	23. mar. 2009	rev 1.4
    	avoid writing to input stop

    hm	12. nov. 2009 rev 1.5
    	limit start and stop to size -1

    *)
END_FUNCTION