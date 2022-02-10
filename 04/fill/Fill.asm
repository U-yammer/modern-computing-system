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


(MAIN_LOOP)
@KBD
D = M

@BLACK_OUT
D; JGT

// @WHITE_OUT
// D; JEQ

@MAIN_LOOP
0; JMP

(MAIN_LOOP_END)


@KBD
D = A

@SCREEN // A <- screen base address
D = A

@pointer
M = D

// @screenFinal
// M = 24575
// @test + 1
// M[D] = 1



//////////////// black
(BLACK_OUT)

@SCREEN // A <- screen base address
D = A

@pointer
M = D

(BLACK_OUT_LOOP)

// 移動の準備
@pointer
D = M // addressの値保存
@KBD
D = A - D      //addressはmaxのbit長を越えていないか？
@BLACK_OUT_END // 越えた場合場合，for文
D;JLE          // D <= 0


@pointer
D = M // put it
A = D // at this, go to screen base address + alpha
// make it black
M = -1


@pointer
M = M + 1 // increment the address @16

@BLACK_OUT_LOOP
0;JMP


@MAIN_LOOP
0;JMP
(BLACK_OUT_END)

@KBD
D = M

@BLACK_OUT
D; JGT

//////////////////////////////////white
(WHITE_OUT)

@SCREEN // A <- screen base address
D = A

@pointer
M = D

(WHITE_OUT_LOOP)
// 移動の準備
@pointer
D = M // addressの値保存
@KBD
D = A - D      //addressはmaxのbit長を越えていないか？
@MAIN_LOOP // 越えた場合場合，for文
D;JLE          // D <= 0


@pointer
D = M // put it
A = D // at this, go to screen base address + alpha
// make it black
M = 0


@pointer
M = M + 1 // increment the address @16

@WHITE_OUT_LOOP
0;JMP

(WHTIE_OUT_END)


@MAIN_LOOP
0;JMP
