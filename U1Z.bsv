package U1Z;
    typedef enum{Mul, Div, Add, Sub, And, Or} AluOps deriving (Eq, Bits);
    interface HelloALU;
        method Action setupCalculation(AluOps op, Int#(32) a, Int#(32) b);
        method ActionValue#(Int#(32)) getResult();
    endinterface
    module mkSimpleALU(HelloALU);
        Reg#(AluOps) operation <- mkRegU;
        Reg#(int) opa <- mkRegU;
        Reg#(int) opb <- mkRegU;

        method Action setupCalculation(AluOps op, Int#(32) a, Int#(32) b);
            operation <= op;
            opa <= a;
            opb <= b;
        endmethod
        method ActionValue#(Int#(32)) getResult();
            let result = case( operation )
                        Mul: return opa * opb;
                        Div: return opb / opb;
                        Add: return opa + opb;
                        Sub: return opa - opb;
                        And: return opa & opb;
                        Or: return opa | opb;
                        default: return 0;
                endcase;
            return result;
        endmethod    
    endmodule
endpackage