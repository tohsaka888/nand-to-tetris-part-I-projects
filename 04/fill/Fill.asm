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
// START:
// kbdAddr = KBD
// screenAddr = SCREEN
// i = 0
// if RAM[kbdAddr] = 0 goto UNPRESSED
// PRESSED:
//  if i == 8192 goto START
//  RAM[screenAddr] = -1
//  screenAddr = screenAddr + 1
//  i = i + 1
//  goto PRESSED
// UNPRESSED:
//  if i = 8192 goto START
//  RAM[screenAddr] = 0
//  screenAddr = screenAddr + 1
//  i = i + 1
//  goto UNPRESSED

(START)
@KBD
D=A
@kbdAddr
M=D // kbdAddr = KBD

@SCREEN
D=A
@screenAddr
M=D // screenAddr = SCREEN

@i
M=0 // i = 0

@kbdAddr
A=M
D=M // RAM[kbdAddr]
@UNPRESSED
D; JEQ // if RAM[kbdAddr] goto UNPRESSED

(PRESSED)
@8192
D=A 
@i 
D=D-M
@START
D; JEQ

@screenAddr
A=M
M=-1 // RAM[screenAddr] = -1

@screenAddr
M=M+1 // screenAddr = screenAddr + 1

@i
M=M+1 // i = i + 1

@PRESSED
0; JMP

(UNPRESSED)
@8192
D=A 
@i 
D=D-M
@START
D; JEQ

@screenAddr
A=M
M=0 // RAM[screenAddr] = 0

@screenAddr
M=M+1 // screenAddr = screenAddr + 1

@i
M=M+1 // i = i + 1

@UNPRESSED
0; JMP


