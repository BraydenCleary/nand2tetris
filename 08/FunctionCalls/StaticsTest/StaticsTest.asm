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
@RETURN_LABEL_FOR_Sys.init_e03fa58b-2a06-4c09-be0c-8d785b209e3a
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
(RETURN_LABEL_FOR_Sys.init_e03fa58b-2a06-4c09-be0c-8d785b209e3a)
// #Generating function
// ~~Setting label for function
(Class1.set)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@0
D=A
@R13
M=D
@R14
M=0
(Class1.set_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@Class1.set_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@Class1.set_LOCAL_VARIABLES_LOOP
0;JMP
(Class1.set_LOCAL_VARIABLES_END)
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
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@Class1.0
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
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@Class1.1
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
@0
D=A
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
// #Generating function
// ~~Setting label for function
(Class1.get)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@0
D=A
@R13
M=D
@R14
M=0
(Class1.get_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@Class1.get_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@Class1.get_LOCAL_VARIABLES_LOOP
0;JMP
(Class1.get_LOCAL_VARIABLES_END)
// #Generating push
// ~~Setting value to be pushed to stack in D
@Class1.0
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
@Class1.1
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
// #Generating function
// ~~Setting label for function
(Class2.set)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@0
D=A
@R13
M=D
@R14
M=0
(Class2.set_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@Class2.set_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@Class2.set_LOCAL_VARIABLES_LOOP
0;JMP
(Class2.set_LOCAL_VARIABLES_END)
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
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@Class2.0
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
// #Generating pop
// ~~Store topmost element in stack in R13
@SP
A=M-1
D=M
@R13
M=D
// ~~Setting pop destination in D
@Class2.1
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
@0
D=A
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
// #Generating function
// ~~Setting label for function
(Class2.get)
// ~~Creating local variables for function (R13 holds number of variables to be created, R14 holds number of variables already created)
@0
D=A
@R13
M=D
@R14
M=0
(Class2.get_LOCAL_VARIABLES_LOOP)
@R13
D=M
@R14
D=M-D
@Class2.get_LOCAL_VARIABLES_END
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
@R14
M=M+1
@Class2.get_LOCAL_VARIABLES_LOOP
0;JMP
(Class2.get_LOCAL_VARIABLES_END)
// #Generating push
// ~~Setting value to be pushed to stack in D
@Class2.0
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
@Class2.1
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
@6
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating push
// ~~Setting value to be pushed to stack in D
@8
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
@RETURN_LABEL_FOR_Class1.set_52a1ec28-3879-4554-b580-4e5a08eefeba
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
D=D-1
@ARG
M=D
// ~~Setting LCL address value as current SP address value
@SP
D=M
@LCL
M=D
// ~~oto function
@Class1.set
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Class1.set_52a1ec28-3879-4554-b580-4e5a08eefeba)
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
@23
D=A
// ~~Push value to stack
@SP
A=M
M=D
// ~~Increment SP by 1
@SP
M=M+1
// #Generating push
// ~~Setting value to be pushed to stack in D
@15
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
@RETURN_LABEL_FOR_Class2.set_e33a4a34-2e2f-437f-95df-4ae20c5dee78
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
D=D-1
@ARG
M=D
// ~~Setting LCL address value as current SP address value
@SP
D=M
@LCL
M=D
// ~~oto function
@Class2.set
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Class2.set_e33a4a34-2e2f-437f-95df-4ae20c5dee78)
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
// #Generating call
// ~~Pushing return address onto stack
@RETURN_LABEL_FOR_Class1.get_65db95d9-353d-4399-8d94-138a709f2c77
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
@Class1.get
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Class1.get_65db95d9-353d-4399-8d94-138a709f2c77)
// #Generating call
// ~~Pushing return address onto stack
@RETURN_LABEL_FOR_Class2.get_34a3314f-24d9-4acf-8d3d-fd8dd804d6ee
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
@Class2.get
0;JMP
// Set a label in the code where execution will resume when function call returns
(RETURN_LABEL_FOR_Class2.get_34a3314f-24d9-4acf-8d3d-fd8dd804d6ee)
// #Generating label
(WHILE)
// #Generating goto
@WHILE
0;JMP
