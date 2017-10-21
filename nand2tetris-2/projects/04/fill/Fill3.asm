// bingbinglai

(KBDLOOP)
//scraddr = screen value
  @SCREEN
  D=A
  @scraddr
  M=D

//kbdaddr = kbd value
  @KBD
  D=A
  @kbdaddr
  M=D-1

//kbdaddr != 0 -> blacken
  @KBD
  D=M
  @BLACKEN
  D;JNE

  @CLEAN
  0;JMP

(BLACKEN)
  @scraddr
  D=M
  @kbdaddr
  D=D-M
  @KBDLOOP
  D;JEQ

  @scraddr
  A=M
  M=-1

  @scraddr
  M=M+1
  @BLACKEN
  0;JMP

(CLEAN)
  @scraddr
  D=M
  @kbdaddr
  D=D-M
  @KBDLOOP
  D;JEQ

  @scraddr
  A=M
  M=0

  @scraddr
  M=M+1
  @CLEAN
  0;JMP
