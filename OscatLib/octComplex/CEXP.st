FUNCTION CEXP
    temp := EXP(X.re);
    CEXP.re := temp * COS(X.im);
    CEXP.im := temp * SIN(X.im);


    (* revision history
    hm	21. feb 2008	rev 1.0
    	original version

    *)
END_FUNCTION