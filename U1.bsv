package U1;
    interface Blinky;
        method Bool blink();
        method Action start(); 
        method ActionValue#(int) stop();
    endinterface
    module mkBlinky(Blinky);
        Reg#(Bool) ctrl_on <- mkReg (False);
        Reg#(Bool) led_on <- mkReg (False);
        Reg#(int) blink_ctr <- mkReg(0);
        rule bLINKRULE(ctrl_on);
            if(led_on) 
                led_on <= False;
            else if(!led_on)
                led_on <= True;
                blink_ctr <= blink_ctr + 1;
        endrule
        method Bool blink();
            return led_on;
        endmethod
        method Action start();
            ctrl_on <= True;
        endmethod
        method ActionValue#(int) stop();
            ctrl_on <= False;
            led_on <= False;
            return blink_ctr;
        endmethod
    endmodule
endpackage