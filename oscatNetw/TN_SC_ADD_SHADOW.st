FUNCTION_BLOCK TN_SC_ADD_SHADOW
    (*http://www.oscat.de/images/OSCATNetwork/oscat_netlib121_en.pdf#page=184*)
    IF TN_SC_XY2_ERROR(Iin_X1,Iin_Y1,Iin_X2,Iin_Y2) THEN RETURN; END_IF

    IF Iin_Y1 < 0 OR Iin_X1 < 0 OR Iin_Y2 < 0 OR Iin_X2 < 0 THEN RETURN; END_IF (* min werte prüfen *)
    IF Iin_Y1 > 23 OR Iin_X1 > 79 OR Iin_Y2 > 23 OR Iin_X2 > 79 THEN RETURN; END_IF (* max werte prüfen *)

    in_Offset := (Iin_Y1 * 80) + Iin_X2;

    IF Iin_OPTION = INT#00 THEN
    	(* Schatten durch Farbanpassung erzeugen *)
    	FOR in_Y := Iin_Y1 TO Iin_Y2 DO
    		Xus_TN_SCREEN.bya_COLOR[in_Offset] := TN_SC_SHADOW_ATTR(Xus_TN_SCREEN.bya_COLOR[in_Offset]);
    		in_Offset := in_Offset + 80;
    		Xus_TN_SCREEN.bya_Line_Update[in_Y] := TRUE; (* Zeile für Update eintragen *)
    	END_FOR
    ELSE
    	(* Schatten durch Farbe Schwarz und Leerzeichen erzeugen *)
    	FOR in_Y := Iin_Y1 TO Iin_Y2 DO
    		Xus_TN_SCREEN.bya_COLOR[in_Offset] := BYTE#00;
    		Xus_TN_SCREEN.bya_CHAR[in_Offset] := BYTE#32;
    		in_Offset := in_Offset + 80;
    		Xus_TN_SCREEN.bya_Line_Update[in_Y] := TRUE; (* Zeile für Update eintragen *)
    	END_FOR
    END_IF

    in_Offset := (Iin_Y2 * 80) + Iin_X1;

    IF Iin_OPTION = INT#00 THEN
    	(* Schatten durch Farbanpassung erzeugen *)
    	FOR in_X  := Iin_X1 TO Iin_X2 DO
    		Xus_TN_SCREEN.bya_COLOR[in_Offset] := TN_SC_SHADOW_ATTR(Xus_TN_SCREEN.bya_COLOR[in_Offset]);
    		in_Offset := in_Offset + 1;
    	END_FOR
    ELSE
    	(* Schatten durch Farbe Schwarz und Leerzeichen erzeugen *)
    	FOR in_X  := Iin_X1 TO Iin_X2 DO
    		Xus_TN_SCREEN.bya_COLOR[in_Offset] := BYTE#00;
    		Xus_TN_SCREEN.bya_CHAR[in_Offset] := BYTE#32;
    		in_Offset := in_Offset + 1;
    	END_FOR
    END_IF

    (* revision history
    ks	10. mai. 2010	rev 1.0
    	original version
    *)
END_FUNCTION_BLOCK