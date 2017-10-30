// push argument 1
@ARG
D=M
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@SP
M=M-1
A=M
D=M
@TMP16b29ea85
M=D
@THAT
D=M
@0
D=D+A
@segmentLocation6b29ea85
M=D
@TMP16b29ea85
D=M
@segmentLocation6b29ea85
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop that 1
@SP
M=M-1
A=M
D=M
@TMP1e6c7ff5a
M=D
@THAT
D=M
@1
D=D+A
@segmentLocatione6c7ff5a
M=D
@TMP1e6c7ff5a
D=M
@segmentLocatione6c7ff5a
A=M
M=D
// push argument 0
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// pop argument 0
@SP
M=M-1
A=M
D=M
@TMP161c92d1f
M=D
@ARG
D=M
@0
D=D+A
@segmentLocation61c92d1f
M=D
@TMP161c92d1f
D=M
@segmentLocation61c92d1f
A=M
M=D
// label MAIN_LOOP_START
(MAIN_LOOP_START)
// push argument 0
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto COMPUTE_ELEMENT
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JNE
// goto END_PROGRAM
@END_PROGRAM
0;JMP
// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// push that 0
@THAT
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push that 1
@THAT
D=M
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
// pop that 2
@SP
M=M-1
A=M
D=M
@TMP1008ee15a
M=D
@THAT
D=M
@2
D=D+A
@segmentLocation008ee15a
M=D
@TMP1008ee15a
D=M
@segmentLocation008ee15a
A=M
M=D
// push pointer 1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D
// push argument 0
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// pop argument 0
@SP
M=M-1
A=M
D=M
@TMP12eedb93b
M=D
@ARG
D=M
@0
D=D+A
@segmentLocation2eedb93b
M=D
@TMP12eedb93b
D=M
@segmentLocation2eedb93b
A=M
M=D
// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP
// label END_PROGRAM
(END_PROGRAM)
