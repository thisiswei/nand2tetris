// R0 * R1 -> R2


// initialize R2 to 0
@R2
M=0

// initialize sum to 0
@sum
M=0


(LOOP)
  // if R0 <=0: end
  @R0
  D = M
  @END
  D ; JLE

  // sum += R1
  @R1
  D = M
  @sum
  M = M+D
  D = M

  // assign val to R2
  @R2
  M = D

  // loop
  @LOOP
  0 ; JMP


(END)
  @END
  0 ; JMP






