package U1Z;
    typedef enum{Mul, Div, Add, Sub, And, Or} AluOps deriving (Eq, Bits);
    interface HelloALU;
        method Action setupCalculation(AluOps op, Int#(32) a, Int#(32) b);
        method ActionValue#(Int#(32)) getResult();
    endinterface
endpackage