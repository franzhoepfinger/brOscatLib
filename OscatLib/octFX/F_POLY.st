FUNCTION F_POLY
    x2 := X * X;
    X4 := X2 * X2;
    X6 := X4 * X2;
    F_POLY := C[7] * X6 * X + C[6] * X6 + C[5] * X4 * X + C[4] * X4 + c[3] * X2*X + C[2] * X2 + C[1] * X + C[0];


    (* revision history
    hm		20. may. 2008		rev 1.0
    	original version

    *)

END_FUNCTION