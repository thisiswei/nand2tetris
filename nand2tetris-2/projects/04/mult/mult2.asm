
/* wei
@R2
M = 0

@sum
M = 0


(LOOP)
    // if R0 == 0 then jump to end
    @R0
    D=M
    @END
    D;JEQ

    // sum += R2
    @R1
    D = M
    @sum
    M = D + M

    // assign @sum to R1
    @sum
    D=M
    @R2
    M=D


    // R0--
    @R0
    M = M -1

    // continue loop
    @LOOP
    0;JMP


(END)
   @END
   0 ; JMP
*/



@R2
M=0

(LOOP)
  @R1
  D=M
  @END
  D;JLE

  @R0
  D=M
  @R2
  M=D+M

  @R1
  M=M-1
  @LOOP
  0;JMP

(END)
  @END
  0;JMP
