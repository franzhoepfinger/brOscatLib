FUNCTION_BLOCK INTERLOCK_4
    (* check if enable is active *)
    IF E THEN
    (* reset all vars when there is a mode change on thy fly *)
    	IF mode <> lmode THEN
    		out := 0;
    		last := 0;
    		old := 0;
    		lmode := mode;
    	END_IF
    	(* load inputs into in *)
    	in.0 := I0;
    	in.1 := I1;
    	in.2 := I2;
    	in.3 := I3;
    	(* only execute when there is any change *)
    	IF in <> last THEN
    		(* only execute when inputs have chages state *)
    		CASE mode OF
    			0:	(* output directly display inputs as bits in byte out *)
    				out := in;

    			1:	(* the input with the highest number will be acepted *)
    				IF in.3 THEN out := 8;
    				ELSIF in.2 THEN out := 4;
    				ELSIF in.1 THEN out := 2;
    				ELSE out := in;
    				END_IF

    			2:	(* input last pressed will be displayed only *)
    				last := ((in XOR last) AND in);
    				IF last.3 THEN out := 8;
    				ELSIF last.2 THEN out := 4;
    				ELSIF last.1 THEN out := 2;
    				ELSE out := last;
    				END_IF

    			3:	(* any input active will disable all other inputs *)
    				IF (out AND in) = 0 THEN
    					IF in.3 THEN out := 8;
    					ELSIF in.2 THEN out := 4;
    					ELSIF in.1 THEN out := 2;
    					ELSE out := in;
    					END_IF
    				END_IF

    		END_CASE
    		last := in;
    	END_IF
    	tp := out <> old;
    	old := out;
    ELSE
    	out := 0;
    	last := 0;
    	old := 0;
    	lmode := 0;
    	tp := FALSE;
    END_IF


    (* revision history
    hm	24. oct 2008	rev 1.0
    	original version

    hm	14. mar. 2009	rev 1.1
    	replaced double assignments

    *)
END_FUNCTION_BLOCK