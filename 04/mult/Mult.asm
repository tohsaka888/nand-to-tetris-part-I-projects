// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// i = 0
// n = R1
// sum = 0
// LOOP:
//  if i == n goto OUTPUT
//  sum = sum + R0
//  i++
//  goto LOOP
// OUTPUT:
// R2 = sum
// END: 
// goto END;

@i
M=0 // i = 0

@R1
D=M 
@n
M=D // n = R1

@sum 
M=0 // sum = 0

(LOOP)
@i 
D=M
@n 
D=M-D // n - i
@OUTPUT
D; JEQ

@R0
D=M
@sum
M=M+D // sum = sum + R0

@i
M=M+1 // i = i + 1

@LOOP
0; JMP

(OUTPUT)
@sum
D=M
@R2
M=D // R2 = sum

(END)
@END
0; JMP


