// push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 333
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 888
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 8
@SP
M=M-1
A=M
D=M
@TMP114c745fb
M=D
@STATIC
D=M
@8
D=D+A
@segmentLocation14c745fb
M=D
@TMP114c745fb
D=M
@segmentLocation14c745fb
A=M
M=D
// pop static 3
@SP
M=M-1
A=M
D=M
@TMP1a184d1a4
M=D
@STATIC
D=M
@3
D=D+A
@segmentLocationa184d1a4
M=D
@TMP1a184d1a4
D=M
@segmentLocationa184d1a4
A=M
M=D
// pop static 1
@SP
M=M-1
A=M
D=M
@TMP11578790d
M=D
@STATIC
D=M
@1
D=D+A
@segmentLocation1578790d
M=D
@TMP11578790d
D=M
@segmentLocation1578790d
A=M
M=D
// push static 3
@STATIC
D=M
@3
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@STATIC
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
// push static 8
@STATIC
D=M
@8
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
