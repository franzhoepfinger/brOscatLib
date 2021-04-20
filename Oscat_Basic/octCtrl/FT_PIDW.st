FUNCTION_BLOCK FT_PIDW
    (* run the integrator *)
    IF tn = 0.0 OR rst THEN
    	integ(E := FALSE, Y := YI);
    	YI := 0.0;
    ELSE
    	integ(X := IN, K := 1.0 / TN, E := NOT LIM, Y := YI);
    END_IF

    (* add up integrator and linear part *)
    Y := KP * (IN + YI);

    (* run differentiator *)
    diff(IN := IN, K := TV);

    (* set lim before differentiator is added to stop integrator if necessary *)
    IF Y > LIM_L AND Y < LIM_H THEN
    	LIM := FALSE;
    ELSE
    	LIM := TRUE;
    END_IF

    (* add differential part and limit output Y *)

    Y := LIMIT(LIM_L, Y + KP * diff.out, LIM_H);




    (* revision history
    hm 3. jun. 2008 	rev 1.0
    	original version

    hm	5. nov. 2008	rev 1.1
    	changed code to use integrate

    hm	11. mar. 2009	rev 1.2
    	real constants updated to new systax using dot

    *)
END_FUNCTION_BLOCK