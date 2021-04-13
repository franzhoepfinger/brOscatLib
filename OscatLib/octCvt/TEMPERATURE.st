FUNCTION_BLOCK TEMPERATURE
    YK := K + (C + 273.15) + (F + 459.67) * 0.555555555555 + (Re * 1.25 + 273.15) + (Ra * 0.555555555555);
    YC := YK -273.15;
    YF := YK * 1.8 - 459.67;
    YRe := (YK - 273.15) * 0.8;
    YRa := YK * 1.8;


    (* revision history
    hm	21. feb. 2008	rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK