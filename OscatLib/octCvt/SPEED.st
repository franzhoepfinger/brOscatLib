FUNCTION_BLOCK SPEED
    Yms := ms +
    		kmh * 0.27777777777778 +
    		kn * 0.5144444 +
    		mh * 0.44704;
    Ykmh := Yms * 3.6;
    Ykn := Yms * 1.94384466037535;
    Ymh := Yms * 2.23693629205440;

    (*
    Geschwindigkeit Meter durch Sekunde m/s 1 m/s = 3,6 km/h
    km durch (pro) Stunde, nicht Stundenkilometer verwenden
    Knoten kn 1 kn = 1 sm/h = 0,5144 m/s

    *)

    (* revision history
    hm	27. mar. 2009	rev 1.0
    	original version

    hm	11. mar. 2009	rev 1.1
    	improved code

    *)
END_FUNCTION_BLOCK