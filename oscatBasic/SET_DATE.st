FUNCTION SET_DATE
    (*http://www.oscat.de/images/OSCATBasic/oscat_basic333_en.pdf#page=136*)
    IF (MONTH > 2) AND (SHL(YEAR,14) = 0)
    THEN (* we add one day for leap year *)
    	SET_DATE := DWORD_TO_DATE((INT_TO_DWORD(ofs[MONTH] + day ) + SHR(INT_TO_DWORD(year) * 1461 - 2878169, 2))*86400);
    ELSE
    	SET_DATE := DWORD_TO_DATE((INT_TO_DWORD(ofs[MONTH] + day - 1 ) + SHR(INT_TO_DWORD(year) * 1461 - 2878169, 2))*86400);
    END_IF


    (* old code
    IF month > 2 THEN
    	count := (month - 1) * 30;
    	IF month > 7 THEN count := count + SHR(month - 3,1); ELSE count := count + SHR(month - 4,1); END_IF
    	(* chech for leap year and add one day if true *)
    	IF SHL(year,14) = 0 THEN count := count + 1; END_IF
    ELSE
    	count := (month - 1) * 31;
    END_IF

    SET_DATE := DWORD_TO_DATE((INT_TO_DWORD(count + day - 1) + SHR(INT_TO_DWORD(year) * 1461 - 2878169, 2)) * 86400);
    *)

    (* revision history
    hm	4. aug. 2006	rev 1.0
    	original version

    hm	19 sep. 2007	rev 1.1
    	use function leap_year to calculate leap year, more exceptions are handled

    hm	1. okt	2007	rev 1.2
    	added compatibility to step7

    hm	16.dec 2007		rev 1.3
    	changed code to improove performance

    hm	3. jan. 2008	rev 1.4
    	further improvements in performance

    hm	16. mar. 2008	rev 1.5
    	added type conversions to avoid warnings under codesys 3.0

    hm	7. apr. 2008	rev 1.6
    	deleted unused step7 code

    hm	14. oct. 2008	rev 1.7
    	optimized code for better performance

    hm	25. oct. 2008	rev 2.0
    	new code using setup constants

    hm	16. nov. 2008	rev 2.1
    	added typecasts to avoid warnings

    hm	22. jan. 2011	rev 2.2
    	improved performance

    hm	29. dec. 2011	rev 2.3
    	improved performance

    hm 3. FEB 2021 rev 2.4
    	new code to be more readable
    *)
END_FUNCTION