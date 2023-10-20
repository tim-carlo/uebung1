package U1;
    interface Blinky;
        method bit blink();
        method Action start(); 
        method ActionValue#(int) stop();
    endinterface
    module mkBlinky(Blinky):
        
    endmodule
endpackage