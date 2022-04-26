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

(LOOP)
    @KBD
    D=A 
    @addr
    M=D     
(INPUT)     // detect a pressed key
    @pixel
    M=0     // set pixel value to white by default
    @KBD 
    D=M
    @MAKEBLACK
    D;JNE   // change pixel to black in case of pressed key
(DRAW)
    @pixel
    D=M  
    @addr
    A=M
    M=D     
    @addr
    M=M-1  
    D=M
    @SCREEN
    D=D-A   
    @LOOP
    D; JLT     //keeps checking keyboard for a press
    @DRAW
    0; JMP     //else remake to white
(MAKEBLACK)
    @pixel
    M=-1     // set pixel value to black
    @DRAW 
    0; JMP
