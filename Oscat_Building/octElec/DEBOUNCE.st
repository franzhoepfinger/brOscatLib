FUNCTION_BLOCK DEBOUNCE
    
    IF NOT deb.Q AND IN THEN
    	(* rising edge on input detetced a *)
    	Q := TRUE;
    ELSIF NOT PM THEN
    	Q := deb.Q;
    ELSE
    	Q := FALSE;
    END_IF

    (* run debounce timer *)
    deb(IN := IN, PT := TD);



    (*
    hm 22. sep. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK