// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@counter
M=1
@sum
M=0

// Return 0 if R1 is 0
@R1
D=M
@SETR2ANDEND
D;JEQ

// Return 0 if R0 is 0
@R0
D=M
@SETR2ANDEND
D;JEQ

// Determine which value to loop over (want to minimize loop count)
@R0
D=M
@R1
D=D-M
// If D is greater than or equal to 0, we want to add R0 to itself R1 times
@ADDLOOPR1TIMES
D;JGE
// If D is less than 0, we want to add R1 to itself R0 times
@ADDLOOPR0TIMES
D;JLT

(ADDLOOPR1TIMES)
  @R0 // This value will get repeatedly added
  D=M
  @sum
  M=D+M

  @R1
  D=M
  @counter
  D=D-M
  @SETR2ANDEND
  D;JEQ
  @counter
  M=M+1
  
  @ADDLOOPR1TIMES
  0;JEQ

(ADDLOOPR0TIMES)
  @R1 // This value will get repeatedly added
  D=M
  @sum
  M=D+M

  @R0
  D=M
  @counter
  D=D-M
  @SETR2ANDEND
  D;JEQ
  @counter
  M=M+1
  
  @ADDLOOPR0TIMES
  0;JEQ

(SETR2ANDEND)
  @sum
  D=M
  @R2
  M=D
  @END
  0;JEQ

(END)
  @END
  0;JEQ
  