FUNCTION_BLOCK CLK_N
    stime := SHR(T_PLC_MS(),N);
    clk := stime.0;
    Q := clk XOR edge;
    edge := CLK;

    (* revision history
    hm	16. dec 2007		rev 1.0
    	original version

    *)
END_FUNCTION_BLOCK