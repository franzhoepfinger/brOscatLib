FUNCTION ISC_UPPER
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=172*)
    IF setup.EXTENDED_ASCII THEN
    	ISC_UPPER :=  ((in > 64) AND (in < 91)) OR (((in > 191) AND (in < 223)) AND (in <> 215));
    ELSE
    	ISC_UPPER := ((in > 64) AND (in < 91));
    END_IF


    (* revision history
    hm	6. mar. 2008	rev 1.0
    	original version

    hm	19. oct. 2008	rev 1.1
    	changes setup constants

    *)
END_FUNCTION