FUNCTION REFLECT
    REFLECT := 0;
    FOR i := 1 TO L DO
    	REFLECT := SHL(REFLECT, 1) OR BOOL_TO_DWORD(D.0);
    	D := SHR(D, 1);
    END_FOR
    REFLECT := REFLECT OR SHL(D, L);

    (* revision history
    hm	 16. jan 2011
    	new module

    *)
END_FUNCTION