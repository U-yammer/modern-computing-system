@i
M = 0

@2
M = 0

(LOOP)
@i
D = M // put M on D

@1
D = D - M // i - memory[1]

@END
D;JGE // if (i - memory[1] = 0)

@0
D = M // R0

@2
M = M + D //

@i
M = M + 1

@LOOP
0;JMP
(END)

@END
0;JMP
