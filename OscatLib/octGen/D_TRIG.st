FUNCTION_BLOCK D_TRIG
    Q := in <> last_in;
    X := in - last_in;
    last_in := in;


    (* revision history

    hm 	4.09.2007		rev 1.0
    	original version released

    hm	19. feb. 2008	rev 1.1
    	performance improvement
    *)
END_FUNCTION_BLOCK