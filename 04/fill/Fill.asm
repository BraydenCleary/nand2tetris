// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@8192 // 256 * 512 / 16 == number of "words" that exist in screen (a word here is 2 bytes, or 16 bits)
D=A
@totalwordsthatmakeupscreen
M=D

(CHECKKEYLOOP)
@KBD
D=M
@i // intitate counter variable that will be compared against @totalwordsthatmakeupscreen for set black/white loops
M=0
@SETTOWHITE
D;JEQ
@SETTOBLACK
D;JGT

(SETTOWHITE)
  @i // in first iteration, i = 0
  D=M
  @totalwordsthatmakeupscreen // once i equals 8192, jump back to CHECKKEYLOOP
  D=D-M
  @CHECKKEYLOOP
  D;JEQ

  @SCREEN
  D=A
  @i
  A=D+M // calculating memory address for next word in screen that will be set to white/black
  M=0

  @i
  M=M+1

  @SETTOWHITE
  0;JMP

(SETTOBLACK)
  @i
  D=M
  @totalwordsthatmakeupscreen
  D=D-M
  @CHECKKEYLOOP
  D;JEQ

  @SCREEN
  D=A
  @i
  A=D+M
  M=-1

  @i
  M=M+1
  
  @SETTOBLACK
  0;JMP
