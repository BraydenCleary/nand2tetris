// Generating function
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
@LCL
D=M
@1
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
// Generating not
@SP
A=M-1
D=!M
M=D
// Generating push
@ARG
D=M
@0
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
// Generating return
