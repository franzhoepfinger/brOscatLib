FUNCTION HOUR
    HOUR := DWORD_TO_INT(TOD_TO_DWORD(itod) / 3600000);


    (* change history
    hm 4. aug 2006	rev 1.0
    	original version

    hm 2.10.2006 	rev 1.1
    	changed name of input to itod

    *)
END_FUNCTION