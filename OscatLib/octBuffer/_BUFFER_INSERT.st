FUNCTION _BUFFER_INSERT
    lx := LEN(str);
    end := pos + lx;
    (* first move the upper part of the buffer to make space for the string *)
    FOR i := UINT_TO_INT(size) - 1 TO end BY -1 DO
    	pt^[i] := pt^[i-lx];
    END_FOR
    (* copy the string *)
    _BUFFER_INSERT := _STRING_TO_BUFFER(str, pos, PT, size);


    (* revision History
    hm 	9. mar. 2008	rev 1.0
    	original version

    hm	16. mar. 2008	rev 1.1
    	changed type of input size to uint

    hm	13. may. 2008	rev 1.2
    	changed type of pointer to array[1..32767]
    	changed size of string to STRING_LENGTH

    hm	23. mar. 2009	rev 1.3
    	avoid writing to input pos

    hm	12. nov. 2009	rev 1.4
    	code optimized

    *)
END_FUNCTION