FUNCTION OSCAT_VERSION
    IF in THEN
    	OSCAT_VERSION := DATE_TO_DWORD(D#2011-03-05);
    ELSE
    	OSCAT_VERSION := 331;
    END_IF

    (* revision history
    hm	6. oct 2006	rev 1.0
    	original version

    hm	16. dec 2007	rev 1.1
    	added possibility to return date and version depending on IN.

    *)
END_FUNCTION