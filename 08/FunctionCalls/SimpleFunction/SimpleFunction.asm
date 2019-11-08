// #Generating function
// ~~Setting label for function
(SimpleFunction.test)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@2
D=A
@R13
M=D
@R14
M=0
(SimpleFunction.test_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@SimpleFunction.test_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@SimpleFunction.test_LOCAL_VARIABLES_LOOP
0;JMP
(SimpleFunction.test_LOCAL_VARIABLES_END)
// #Generating push
// ~~Setting value to be pushed to stack in D
@LCL
D=M
@0
A=D+A
D=M
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating push
// ~~Setting value to be pushed to stack in D
@LCL
D=M
@1
A=D+A
D=M
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating add
// ~~Add two topmost elements in stack and store in SP-2 (decrements SP by 1)
@SP
A=M-1
D=M
A=A-1
D=D+M
M=D
@SP
M=M-1
// #Generating bitwise not
// ~~Take bitwise not of topmost element in stack
@SP
A=M-1
D=!M
M=D
// #Generating push
// ~~Setting value to be pushed to stack in D
@ARG
D=M
@0
A=D+A
D=M
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating add
// ~~Add two topmost elements in stack and store in SP-2 (decrements SP by 1)
@SP
A=M-1
D=M
A=A-1
D=D+M
M=D
@SP
M=M-1
// #Generating push
// ~~Setting value to be pushed to stack in D
@ARG
D=M
@1
A=D+A
D=M
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating sub
// ~~Subtract topmost element from stack from second to topmost element in stack and store in SP-2 (decrements SP by 1)
@SP
A=M-1
D=M
A=A-1
D=M-D
M=D
@SP
M=M-1
// #Generating return
// ~~Generating Frame = LCL
@LCL
D=M
@temp_frame
M=D
// ~~Generating RET = *(FRAME-5)
@temp_frame
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
A=D
D=M
@temp_go_to_at_end_of_return
M=D
// ~~Generating *ARG = pop()
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@5
D=A
@3
D=D+A
// ~~Storing pop destination in R14
@R14
M=D
@R13
D=M
// ~~Set target A value and move popped item to destination
@R14
A=M
M=D
// ~~Decrement SP by 1
@SP
M=M-1
@8
D=M
@ARG
A=M
M=D
// ~~Generating SP = ARG + 1
@ARG
D=M
@SP
M=D+1
// ~~Generating THAT = *(FRAME-1)
@temp_frame
D=M
D=D-1
A=D
D=M
@THAT
M=D
// ~~Generating THIS = *(FRAME-2)
@temp_frame
D=M
D=D-1
D=D-1
A=D
D=M
@THIS
M=D
// ~~Generating ARG = *(FRAME-3)
@temp_frame
D=M
D=D-1
D=D-1
D=D-1
A=D
D=M
@ARG
M=D
// ~~Generating LCL = *(FRAME-4)
@temp_frame
D=M
D=D-1
D=D-1
D=D-1
D=D-1
A=D
D=M
@LCL
M=D
@temp_go_to_at_end_of_return
A=M
0;JMP
