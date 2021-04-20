FUNCTION SIGMOID
    IF X > 20.0 THEN
    	SIGMOID := 1.0;
    ELSIF x < -85.0 THEN
    	SIGMOID := 0.0;
    ELSE
    	SIGMOID := 1.0 / (1.0 + EXP(-X));
    END_IF


    (* revision history
    hm	10.12.2007		rev 1.0
    	original version

    hm	11. mar. 2008		rev 1.1
    	extended range of valid inputs to +inv / -inv

    hm 10. mar. 2009		rev 1.2
    	real constants updated to new systax using dot																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											

    *)
END_FUNCTION