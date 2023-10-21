package U1ZTb;
    import U1Z::*;
    typedef enum{Mul, Div, Add, Sub, And, Or} AluOps deriving (Eq, Bits);
    module mkU1ZTb();
        HelloALU myALU <- mkSimpleALU;
        Reg#(int) opa <- mkReg(42);
        Reg#(int) opb <- mkReg(10);
        Reg#(Bool) instantiated <- mkReg(False);
        Reg#(Bool) calcSet <- mkReg(False);
        Reg#(Bool) checked <- mkReg(False);

        rule instantiate(!instantiated);
            instantiated <= True;
            myALU.setupCalculation(Add, opa, opb);
            calcSet <= True;
        endrule
        rule getResult(instantiated && calcSet);
            let result <- myALU.getResult;
            $display("Result: %d", result);
            checked <= True;
        endrule
        rule shutdown (checked);
            $finish();
        endrule
    endmodule    
endpackage