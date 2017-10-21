// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// KBD: 24576
// SCREEN: 16384

@SCREEN
D=A
@address
M=D

// @kbdaddress = KBD address
@KBD
D=A
@kbdaddress
M=D


// if @kdbval != 0
//    do (FILLSCREEN)
// else
//    do (loopback)
(LOOPKBD)
    // get KBD value
    @KBD
    D=M

    // if @kdbval != 0
    @LOOPKBD
    D;JEQ

    // reset address back to screen address
    @SCREEN
    D=A
    @address
    M=D

    @FILLSCREEN
    0;JMP

    // @CLEARSCREEN
    // 0;JMP


// not sure why clear screen does not work
// symptoms:
// 1. without clearscreen, the screen will be black even if we release the keyboard.
// 2. with clearscreen, the screen will be black without pressing any keys.


// turn screen back to white
(CLEARSCREEN)
    @address
    // if address >= @kbdaddress stop
    // otherwise loop
    D=M

    @kbdaddress
    D=M-D

    // if less or equal 0
    @LOOPKBD
    D;JLT

    // draw black pixel
    @address
    A=M
    M=0

    // inc address
    @address
    M=M+1

    @CLEARSCREEN
    0;JMP


(FILLSCREEN)
    @address
    // if address >= @kbdaddress stop
    // otherwise loop
    D=M

    @kbdaddress
    D=M-D

    // if less or equal 0
    @LOOPKBD
    D;JLT

    // draw black pixel
    @address
    A=M
    M=-1

    // inc address
    @address
    M=M+1

    @FILLSCREEN
    0;JMP
