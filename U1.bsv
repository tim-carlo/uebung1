package U1;
    interface Blinky;
        method bit blink();
        method Action start(); 
        method ActionValue#(int) stop();
    endinterface
    module mkBlinky(Blinky):
        Reg#(bit) ctrl_on <- mkReg(0);
        Reg#(bit) led_on <- mkReg(0);
        Reg#(int) blink_ctr <- mkReg(0);
        rule bLINKRULE(ctrl_on);
            if(led_on)
                led_on <= 0
            else if(!led_on)
                led_on <= 1
                blink_ctr <= blink_ctr + 1
        endrule
        method bit blink();
            return led_on;
        endmethod
        method Action start();
            ctrl_on <= 1;
        endmethod
        method ActionValue#(int) stop();
            ctrl_on <= 0;
            led_on <= 0;
            return blink_ctr;
        endmethod
    endmodule
endpackage