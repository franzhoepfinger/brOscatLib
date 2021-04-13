FUNCTION_BLOCK FT_PD
    (* run differentiator *)
    diff(IN := IN, K := TV);

    (* combine both values *)
    Y := KP * (diff.out + IN);



    (* revision history
    hm 	3. jun. 2008 	rev 1.0
    	original version


    *)
END_FUNCTION_BLOCK