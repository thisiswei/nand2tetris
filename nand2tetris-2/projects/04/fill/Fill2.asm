@SCREEN
D=A

// assign screen address to @addr
@addr
M=D


@KBD
D=A
@kbraddr
M=D-1


(LOOP)
    // prob for kbd value
    @KBD
    D=M

    // check if kbd == 0
    @CLEAR
    D ; JEQ

    // otherwise draw
    @DRAW
    0 ; JMP


(CLEAR)
   // reset addr back to screen address
   @SCREEN
   D=A
   @addr
   M=D

   (CLEARLOOP)
       // get addr value
       @addr
       D=M
       // if the screen all clear
       // loopback
       @kbraddr
       D=M-D

       // loop back if @add reached KBD address
       @LOOP
       D;JEQ

       // clear
       @addr
       A=M
       M=0

       // increment addr
       @addr
       M=M+1

       // keep clear
       @CLEARLOOP
       0 ; JMP


(DRAW)
   // reset addr back to screen address
   @SCREEN
   D=A
   @addr
   M=D

   (DRAWLOOP)
       // get addr value
       @addr
       D=M

       @kbraddr
       D=D-M

       @LOOP
       D ; JEQ

       // assign -1 to address and incr
       @addr
       A=M
       M=-1

       @addr
       M=M+1

       @DRAWLOOP
       0 ; JMP
