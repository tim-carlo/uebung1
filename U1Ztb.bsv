package U1ZTb;
    import U1Z::*;
    typedef enum{Mul, Div, Add, Sub, And, Or} AluOps deriving (Eq, Bits);
    module mkU1ZTb();
        HelloALU myALU <- mkSimpleALU;
        Reg#(int) opa <- mkReg(42);
        Reg#(int) opb <- mkReg(10);
        Reg#(Bool) Instantiated <- mkReg(False);
        Reg#(Bool) CalcSet <- mkReg(False);

        rule instantiate(!Instantiated);
            Instantiated <= True;
            myALU.setupCalculation(Add, opa, opb);
            CalcSet <= True;
        endrule
        rule getResult(Instantiated && CalcSet);
            let result <- 
            $display("Result: %d");
            checked <= True;
        endrule
        rule shutdown (checked);
            $finish();
        endrule
    endmodule    
endpackage