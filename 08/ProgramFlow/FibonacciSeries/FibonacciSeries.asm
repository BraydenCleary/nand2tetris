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
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@THAT
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
@0
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
@1
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
// Generating push
@2
D=A
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
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@ARG
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
// Generating label
(MAIN_LOOP_START)
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
// Generating if
@SP
A=M-1
D=M
@SP
M=M-1
@COMPUTE_ELEMENT
D;JNE
// Generating goto
@END_PROGRAM
0;JMP
// Generating label
(COMPUTE_ELEMENT)
// Generating push
@THAT
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
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// Generating push
@1
D=A
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
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@THAT
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
// Generating push
@1
D=A
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
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@ARG
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
// Generating goto
@MAIN_LOOP_START
0;JMP
// Generating label
(END_PROGRAM)
