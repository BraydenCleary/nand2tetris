// Generating bootstrap
@256
D=A
@SP
M=D
@5000
D=A
@LCL
M=D
@6000
D=A
@ARG
M=D
@3000
D=A
@THIS
M=D
@4000
D=A
@THAT
M=D
// Generating call
@RETURN_LABEL_FOR_Sys.init_4650aaff-0beb-456a-bbce-591b96717ec0
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
@SP
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(RETURN_LABEL_FOR_Sys.init_4650aaff-0beb-456a-bbce-591b96717ec0)
// Generating function
(Main.fibonacci)
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
// Generating lt
@SP
A=M-1
D=M
A=A-1
D=M-D
@X_IS_LESS_THAN_91a02920-0f89-4dce-aba0-a55845fc6ab8
D;JLT
@X_IS_NOT_LESS_THAN_91a02920-0f89-4dce-aba0-a55845fc6ab8
D;JGE
(X_IS_LESS_THAN_91a02920-0f89-4dce-aba0-a55845fc6ab8)
@SP
A=M-1
A=A-1
M=-1
@LT_END_91a02920-0f89-4dce-aba0-a55845fc6ab8
0;JMP
(X_IS_NOT_LESS_THAN_91a02920-0f89-4dce-aba0-a55845fc6ab8)
@SP
A=M-1
A=A-1
M=0
@LT_END_91a02920-0f89-4dce-aba0-a55845fc6ab8
0;JMP
(LT_END_91a02920-0f89-4dce-aba0-a55845fc6ab8)
@SP
M=M-1
// Generating if
@SP
A=M-1
D=M
@SP
M=M-1
@IF_TRUE
D;JNE
// Generating goto
@IF_FALSE
0;JMP
// Generating label
(IF_TRUE)
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
// Generating Frame = LCL
@LCL
D=M
@temp_frame
M=D
// Generating RET = *(FRAME-5)
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
// Generating *ARG = pop()
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@5
D=A
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
@5
D=M
@ARG
A=M
M=D
// Generating SP = ARG + 1
@ARG
D=M
@SP
M=D+1
// Generating THAT = *(FRAME-1)
@temp_frame
D=M
D=D-1
A=D
D=M
@THAT
M=D
// Generating THIS = *(FRAME-2)
@temp_frame
D=M
D=D-1
D=D-1
A=D
D=M
@THIS
M=D
// Generating ARG = *(FRAME-3)
@temp_frame
D=M
D=D-1
D=D-1
D=D-1
A=D
D=M
@ARG
M=D
// Generating LCL = *(FRAME-4)
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
// Generating label
(IF_FALSE)
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
// Generating call
@RETURN_LABEL_FOR_Main.fibonacci_dcedd4eb-47ae-4633-8690-633f698c80e2
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
@SP
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(RETURN_LABEL_FOR_Main.fibonacci_dcedd4eb-47ae-4633-8690-633f698c80e2)
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
// Generating call
@RETURN_LABEL_FOR_Main.fibonacci_4ea96177-ae5f-4247-a8f6-3cb17295935d
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
@SP
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(RETURN_LABEL_FOR_Main.fibonacci_4ea96177-ae5f-4247-a8f6-3cb17295935d)
// Generating add
@SP
A=M-1
D=M
A=A-1
D=D+M
M=D
@SP
M=M-1
// Generating Frame = LCL
@LCL
D=M
@temp_frame
M=D
// Generating RET = *(FRAME-5)
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
// Generating *ARG = pop()
// Generating pop
@SP
A=M-1
D=M
@R13
M=D
@5
D=A
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
@5
D=M
@ARG
A=M
M=D
// Generating SP = ARG + 1
@ARG
D=M
@SP
M=D+1
// Generating THAT = *(FRAME-1)
@temp_frame
D=M
D=D-1
A=D
D=M
@THAT
M=D
// Generating THIS = *(FRAME-2)
@temp_frame
D=M
D=D-1
D=D-1
A=D
D=M
@THIS
M=D
// Generating ARG = *(FRAME-3)
@temp_frame
D=M
D=D-1
D=D-1
D=D-1
A=D
D=M
@ARG
M=D
// Generating LCL = *(FRAME-4)
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
// Generating function
(Sys.init)
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
// Generating push
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// Generating call
@RETURN_LABEL_FOR_Main.fibonacci_7447b34c-514d-46d5-b85a-1061ea8f3ed8
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
@SP
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(RETURN_LABEL_FOR_Main.fibonacci_7447b34c-514d-46d5-b85a-1061ea8f3ed8)
// Generating label
(WHILE)
// Generating goto
@WHILE
0;JMP