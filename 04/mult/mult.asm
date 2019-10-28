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
@SETR2
D;JEQ

// Return 0 if R0 is 0
@R0
D=M
@SETR2
D;JEQ

(ADDLOOP)
  @R1 // this will the the value that gets added to itself R0 times
  D=M
  @sum
  M=D+M

  @R0 // this is the value that determines how many times R1 gets added to itself
  D=M
  @counter
  D=D-M
  @SETR2
  D;JEQ
  @counter
  M=M+1
  
  @ADDLOOP
  0;JEQ

(SETR2)
  @sum
  D=M
  @R2
  M=D
  @END
  0;JEQ

(END)
  @END
  0;JEQ
  