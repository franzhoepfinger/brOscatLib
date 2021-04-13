FUNCTION MUX_R4
    IF A1 THEN
    	MUX_R4 := SEL(A0, IN2, IN3);
    ELSE
    	MUX_R4 := SEL(A0, IN0, IN1);
    END_IF



    (* revision history
    hm	19. jan 2007	rev 1.0
    	original version

    hm	16. oct. 2008	rev 1.1
    	improved performance
    *)
END_FUNCTION