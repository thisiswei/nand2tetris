// function Sys.init 0
(Sys.init)
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Class1.set 2
@return-addressf604da21
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@5
D=D+A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.set
0;JMP
(return-addressf604da21)
// pop temp 0
@SP
M=M-1
A=M
D=M
@TMP144633201
M=D
@R5
D=A
@0
D=D+A
@segmentLocation44633201
M=D
@TMP144633201
D=M
@segmentLocation44633201
A=M
M=D
// push constant 23
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Class2.set 2
@return-addresse765494e
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@5
D=D+A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.set
0;JMP
(return-addresse765494e)
// pop temp 0
@SP
M=M-1
A=M
D=M
@TMP154f7c8d1
M=D
@R5
D=A
@0
D=D+A
@segmentLocation54f7c8d1
M=D
@TMP154f7c8d1
D=M
@segmentLocation54f7c8d1
A=M
M=D
// call Class1.get 0
@return-address57a14c41
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@5
D=D+A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.get
0;JMP
(return-address57a14c41)
// call Class2.get 0
@return-addressaa407db4
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@5
D=D+A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.get
0;JMP
(return-addressaa407db4)
// label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP
// function Class1.set 0
(Class1.set)
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
// pop static 0
@SP
M=M-1
A=M
D=M
@StaticTest1.0
M=D
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
// pop static 1
@SP
M=M-1
A=M
D=M
@StaticTest1.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@LCL
D=M
@FRAMEb5230094
M=D
@5
D=A
@FRAMEb5230094
D=M-D
A=D
D=M
@RETb5230094
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M
@SP
M=D+1
@FRAMEb5230094
A=M-1
D=M
@THAT
M=D
@FRAMEb5230094
D=M
@2
D=D-A
A=D
D=M
@THIS
M=D
@FRAMEb5230094
D=M
@3
D=D-A
A=D
D=M
@ARG
M=D
@FRAMEb5230094
D=M
@4
D=D-A
A=D
D=M
@LCL
M=D
@RETb5230094
A=M
0;JMP
// function Class1.get 0
(Class1.get)
// push static 0
@StaticTest1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@StaticTest1.1
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
// return
@LCL
D=M
@FRAME2d48ca5b
M=D
@5
D=A
@FRAME2d48ca5b
D=M-D
A=D
D=M
@RET2d48ca5b
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M
@SP
M=D+1
@FRAME2d48ca5b
A=M-1
D=M
@THAT
M=D
@FRAME2d48ca5b
D=M
@2
D=D-A
A=D
D=M
@THIS
M=D
@FRAME2d48ca5b
D=M
@3
D=D-A
A=D
D=M
@ARG
M=D
@FRAME2d48ca5b
D=M
@4
D=D-A
A=D
D=M
@LCL
M=D
@RET2d48ca5b
A=M
0;JMP
// function Class2.set 0
(Class2.set)
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
// pop static 0
@SP
M=M-1
A=M
D=M
@StaticTest2.0
M=D
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
// pop static 1
@SP
M=M-1
A=M
D=M
@StaticTest2.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@LCL
D=M
@FRAMEc2a81668
M=D
@5
D=A
@FRAMEc2a81668
D=M-D
A=D
D=M
@RETc2a81668
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M
@SP
M=D+1
@FRAMEc2a81668
A=M-1
D=M
@THAT
M=D
@FRAMEc2a81668
D=M
@2
D=D-A
A=D
D=M
@THIS
M=D
@FRAMEc2a81668
D=M
@3
D=D-A
A=D
D=M
@ARG
M=D
@FRAMEc2a81668
D=M
@4
D=D-A
A=D
D=M
@LCL
M=D
@RETc2a81668
A=M
0;JMP
// function Class2.get 0
(Class2.get)
// push static 0
@StaticTest2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@StaticTest2.1
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
// return
@LCL
D=M
@FRAMEfceaac25
M=D
@5
D=A
@FRAMEfceaac25
D=M-D
A=D
D=M
@RETfceaac25
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M
@SP
M=D+1
@FRAMEfceaac25
A=M-1
D=M
@THAT
M=D
@FRAMEfceaac25
D=M
@2
D=D-A
A=D
D=M
@THIS
M=D
@FRAMEfceaac25
D=M
@3
D=D-A
A=D
D=M
@ARG
M=D
@FRAMEfceaac25
D=M
@4
D=D-A
A=D
D=M
@LCL
M=D
@RETfceaac25
A=M
0;JMP