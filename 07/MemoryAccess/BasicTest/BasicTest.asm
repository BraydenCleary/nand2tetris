// Generating push
@10
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
@LCL
D=M
@0
D=D+A
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
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
// Generating push
@22
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
@ARG
D=M
@2
D=D+A
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
@ARG
D=M
@1
D=D+A
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
@36
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
@THIS
D=M
@6
D=D+A
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
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
// Generating push
@45
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
@THAT
D=M
@5
D=D+A
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
@THAT
D=M
@2
D=D+A
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
@510
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
@5
D=A
@6
D=D+A
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
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Generating push
@THAT
D=M
@5
A=D+A
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
// Generating push
@ARG
D=M
@1
A=D+A
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
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Generating push
@THIS
D=M
@6
A=D+A
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
@5
D=A
@6
A=D+A
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