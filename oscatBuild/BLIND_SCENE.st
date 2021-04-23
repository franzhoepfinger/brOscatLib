FUNCTION_BLOCK BLIND_SCENE
    (*http://www.oscat.de/images/OSCATBuilding/oscat_building100_en.pdf#page=87*)
    (* delete all bits except the lower 4 of scene *)
    x := scene AND 16#0F;

    IF enable AND sx[x,2] > 0 AND UP AND DN THEN
    	po := sx[x,0];
    	ao := sx[x,1];
    	status := 160 + x;  (* Status number is 160 to 175 for the 16 scenes *)
    	QU := TRUE;
    	QD := TRUE;
    ELSE
    	QU := UP;
    	QD := DN;
    	status := S_IN;
    	po := pi;
    	ao := ai;
    END_IF

    (* write scene if necessary *)
    IF swrite THEN
    	status := 176;		(* write scene *)
    	sx[x,0] := pi;
    	sx[x,1] := ai;
    	IF enable THEN sx[x,2] := 1; ELSE sx[x,2] := 0; END_IF (* if sx[x,2] = 0 the scene is disabled *)
    END_IF


    (* revision history
    hm	24. oct 2007	rev 1.0
    	original release

    hm		29.1.2008	rev 1.1
    	replaced shr/shl with and for better performance
    *)


END_FUNCTION_BLOCK