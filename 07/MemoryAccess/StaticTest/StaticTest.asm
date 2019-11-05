// Generating push
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// Generating push
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
// Generating push
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@StaticTest.8
D=A
@R14
M=D
@R13
D=M
@R14
A=M
M=D
@SP
M=M-1
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@StaticTest.3
D=A
@R14
M=D
@R13
D=M
@R14
A=M
M=D
@SP
M=M-1
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@StaticTest.1
D=A
@R14
M=D
@R13
D=M
@R14
A=M
M=D
@SP
M=M-1
// Generating push
@StaticTest.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// Generating push
@StaticTest.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// Generating sub
@SP
A=M-1
D=M
A=A-1
D=M-D
M=D
@SP
M=M-1
// Generating push
@StaticTest.8
D=M
@SP
A=M
M=D
@SP
M=M+1
// Generating add
@SP
A=M-1
D=M
A=A-1
D=D+M
M=D
@SP
M=M-1
