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
@RETURN_LABEL_FOR_Sys.init_0f3917c4-e7a7-44b5-8597-c6c8659a3fb4
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
(RETURN_LABEL_FOR_Sys.init_0f3917c4-e7a7-44b5-8597-c6c8659a3fb4)
// #Generating function
// ~~Setting label for function
(Main.fibonacci)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@0
D=A
@R13
M=D
@R14
M=0
(Main.fibonacci_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@Main.fibonacci_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@Main.fibonacci_LOCAL_VARIABLES_LOOP
0;JMP
(Main.fibonacci_LOCAL_VARIABLES_END)
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
@2
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating lt
// ~~Subtract topmost element from stack from second to topmost element in stack and store in D
@SP
A=M-1
D=M
A=A-1
D=M-D
// ~~If D is less than 0, we know that x (second to topmost element in stack) is less than y (topmost element in stack)
@X_IS_LESS_THAN_8db84a74-cbd3-45c1-80cd-bf9ca2d3b764
D;JLT
// ~~If D is greater than or equal to 0, we know that x (second to topmost element in stack) is not less than y (topmost element in stack)
@X_IS_NOT_LESS_THAN_8db84a74-cbd3-45c1-80cd-bf9ca2d3b764
D;JGE
(X_IS_LESS_THAN_8db84a74-cbd3-45c1-80cd-bf9ca2d3b764)
// ~~For the less than case, set SP-2 to -1 (all 1s in binary)
@SP
A=M-1
A=A-1
M=-1
@LT_END_8db84a74-cbd3-45c1-80cd-bf9ca2d3b764
0;JMP
(X_IS_NOT_LESS_THAN_8db84a74-cbd3-45c1-80cd-bf9ca2d3b764)
// ~~For the not less than case, set SP-2 to 0
@SP
A=M-1
A=A-1
M=0
@LT_END_8db84a74-cbd3-45c1-80cd-bf9ca2d3b764
0;JMP
(LT_END_8db84a74-cbd3-45c1-80cd-bf9ca2d3b764)
// ~~Decrement SP by 1
@SP
M=M-1
// #Generating if
@SP
A=M-1
D=M
@SP
M=M-1
// ~~Jump to label if topmost element in stack is not 0 (note: pops topmost element in stack)
@IF_TRUE
D;JNE
// #Generating goto
@IF_FALSE
0;JMP
// #Generating label
(IF_TRUE)
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
// #Generating label
(IF_FALSE)
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
@2
D=A
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
// #Generating call
// ~~Pushing return address onto stack
@RETURN_LABEL_FOR_Main.fibonacci_80a79c6b-c2fd-47f5-b1b8-778d77ce25e4
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
@Main.fibonacci
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Main.fibonacci_80a79c6b-c2fd-47f5-b1b8-778d77ce25e4)
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
@1
D=A
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
// #Generating call
// ~~Pushing return address onto stack
@RETURN_LABEL_FOR_Main.fibonacci_750ba357-adc2-407b-9d53-d057cdcd2aff
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
@Main.fibonacci
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Main.fibonacci_750ba357-adc2-407b-9d53-d057cdcd2aff)
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
@4
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
@RETURN_LABEL_FOR_Main.fibonacci_b11c5216-a386-4862-a6af-898021ca7865
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
@Main.fibonacci
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Main.fibonacci_b11c5216-a386-4862-a6af-898021ca7865)
// #Generating label
(WHILE)
// #Generating goto
@WHILE
0;JMP
