// #Generating bootstrap
// ~~Setting SP to 256
@256
D=A
@SP
M=D
// ~~Setting LCL to 5000
@5000
D=A
@LCL
M=D
// ~~Setting ARG to 6000
@6000
D=A
@ARG
M=D
// ~~Setting THIS to 6000
@3000
D=A
@THIS
M=D
// ~~Setting THAT to 6000
@4000
D=A
@THAT
M=D
// #Generating call
// ~~Pushing return address onto stack
@RETURN_LABEL_FOR_Sys.init_5d6cf1da-5204-4225-98e1-2cda88d80fe9
D=A
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current LCL address value onto stack
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current ARG address value onto stack
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current THIS address value onto stack
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current THAT address value onto stack
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Setting ARG as SP - number of args - 5
@SP
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
// ~~Setting LCL address value as current SP address value
@SP
D=M
@LCL
M=D
// ~~oto function
@Sys.init
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Sys.init_5d6cf1da-5204-4225-98e1-2cda88d80fe9)
// #Generating function
// ~~Setting label for function
(Sys.init)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@0
D=A
@R13
M=D
@R14
M=0
(Sys.init_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@Sys.init_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@Sys.init_LOCAL_VARIABLES_LOOP
0;JMP
(Sys.init_LOCAL_VARIABLES_END)
// #Generating push
// ~~Setting value to be pushed to stack in D
@4000
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@THIS
D=A
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@5000
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@THAT
D=A
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
// #Generating call
// ~~Pushing return address onto stack
@RETURN_LABEL_FOR_Sys.main_0ada501d-17c9-484e-b267-018ff6c2657a
D=A
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current LCL address value onto stack
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current ARG address value onto stack
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current THIS address value onto stack
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current THAT address value onto stack
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Setting ARG as SP - number of args - 5
@SP
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
// ~~Setting LCL address value as current SP address value
@SP
D=M
@LCL
M=D
// ~~oto function
@Sys.main
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Sys.main_0ada501d-17c9-484e-b267-018ff6c2657a)
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
@1
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
// #Generating label
(LOOP)
// #Generating goto
@LOOP
0;JMP
// #Generating function
// ~~Setting label for function
(Sys.main)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@5
D=A
@R13
M=D
@R14
M=0
(Sys.main_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@Sys.main_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@Sys.main_LOCAL_VARIABLES_LOOP
0;JMP
(Sys.main_LOCAL_VARIABLES_END)
// #Generating push
// ~~Setting value to be pushed to stack in D
@4001
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@THIS
D=A
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@5001
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@THAT
D=A
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@200
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@LCL
D=M
@1
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@40
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@LCL
D=M
@2
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@6
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@LCL
D=M
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@123
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating call
// ~~Pushing return address onto stack
@RETURN_LABEL_FOR_Sys.add12_e8260b09-0ed7-45f8-bbeb-50a652e50962
D=A
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current LCL address value onto stack
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current ARG address value onto stack
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current THIS address value onto stack
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Pushing current THAT address value onto stack
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ~~Setting ARG as SP - number of args - 5
@SP
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
// ~~Setting LCL address value as current SP address value
@SP
D=M
@LCL
M=D
// ~~oto function
@Sys.add12
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Sys.add12_e8260b09-0ed7-45f8-bbeb-50a652e50962)
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
@0
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@LCL
D=M
@2
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
@3
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
@4
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
// #Generating function
// ~~Setting label for function
(Sys.add12)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@0
D=A
@R13
M=D
@R14
M=0
(Sys.add12_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@Sys.add12_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@Sys.add12_LOCAL_VARIABLES_LOOP
0;JMP
(Sys.add12_LOCAL_VARIABLES_END)
// #Generating push
// ~~Setting value to be pushed to stack in D
@4002
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@THIS
D=A
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@5002
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@THAT
D=A
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
// #Generating push
// ~~Setting value to be pushed to stack in D
@12
D=A
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
