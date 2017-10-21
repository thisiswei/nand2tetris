// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@True86ba45b0
D ; JEQ
@SP
A=M
M=0
@END86ba45b0
0 ; JMP
(True86ba45b0)
 @SP
 A=M
 M=1
(END86ba45b0)
 @SP
 M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@Truec442c7de
D ; JEQ
@SP
A=M
M=0
@ENDc442c7de
0 ; JMP
(Truec442c7de)
 @SP
 A=M
 M=1
(ENDc442c7de)
 @SP
 M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@True94b7dee0
D ; JEQ
@SP
A=M
M=0
@END94b7dee0
0 ; JMP
(True94b7dee0)
 @SP
 A=M
 M=1
(END94b7dee0)
 @SP
 M=M+1
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@True334edb1d
D ; JLT
@SP
A=M
M=0
@END334edb1d
0 ; JMP
(True334edb1d)
 @SP
 A=M
 M=1
(END334edb1d)
 @SP
 M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@Trueb5ab41f0
D ; JLT
@SP
A=M
M=0
@ENDb5ab41f0
0 ; JMP
(Trueb5ab41f0)
 @SP
 A=M
 M=1
(ENDb5ab41f0)
 @SP
 M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@True378648fd
D ; JLT
@SP
A=M
M=0
@END378648fd
0 ; JMP
(True378648fd)
 @SP
 A=M
 M=1
(END378648fd)
 @SP
 M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@Truecae08909
D ; JGT
@SP
A=M
M=0
@ENDcae08909
0 ; JMP
(Truecae08909)
 @SP
 A=M
 M=1
(ENDcae08909)
 @SP
 M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@Trueb9e794c2
D ; JGT
@SP
A=M
M=0
@ENDb9e794c2
0 ; JMP
(Trueb9e794c2)
 @SP
 A=M
 M=1
(ENDb9e794c2)
 @SP
 M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@Trued4935a6a
D ; JGT
@SP
A=M
M=0
@ENDd4935a6a
0 ; JMP
(Trued4935a6a)
 @SP
 A=M
 M=1
(ENDd4935a6a)
 @SP
 M=M+1
// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 53
@53
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
// push constant 112
@112
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
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// not
@SP
M=M-1
A=M
D=M
@Falsef96e7554
D ; JEQ
@SP
A=M
M=0
@ENDf96e7554
0 ; JEQ
(Falsef96e7554)
 @SP
 A=M
 M=1
(ENDf96e7554)
 @SP
 M=M+1
