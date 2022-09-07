// William Alejandro pabon Guerrero
// 225366
// william.pabon@upb.edu.co

(INIT)
        @KBD
        D=M
        @84
        D=D-A

        @SETLINEV       //Vertical line set up
        D;JEQ
        //Cinfigure T input

        @KBD
        D=M
        @67
        D=D-A

        @color
        M=0

        @SETLCL       //Clean screen set up
        D;JEQ
        //Cinfigure C input


        @INIT
        D;JMP



(SETCL)
        @iscroos
        M=1

        @16384          //16384 + (0*32) + (0/16)
        D=A
        @coord          //Variable that save start of the screen memory 
        M=D

        @8192           //register amount
        D=A
        @cont           //files counter
        M=D

        @1
        D=A 
        @salto          //jump
        M=D

        @RECT
        0;JMP



(SETLINEH)
        @iscroos
        M=1

        @color
        M=-1

        @20480          //16384 + (128*32) + (0*16)
        D=A
        @coord          //Variable that save start of the screen memory 
        M=D

        @32             //register amount
        D=A
        @cont           //files counter
        M=D

        @1
        D=A
        @jump           //jump
        M=D

        @RECT
        0;JMP



(SETLINEV)
        @iscroos
        M=0

        @256
        D=A
        @color
        M=D

        @16400          //16384 + (0*32) + (256/16)
        D=A
        @coord          //Variable that save start of the screen memory 
        M=D  

        @256            //register amount
        D=A
        @cont           //files counter
        M=D

        @32             //jump
        D=A
        @jump
        M=D

        @RECT
        0;JMP



(RECT)
        @coord 
        D=M
        @pscreen
        M=D



(PAINT)
        @cont           
        D=M

        @END
        D;JEQ           //if cont = 0 go to END

        //-----------------------------------------------------

        @color
        D=M
        @pscreen
        A=M
        M=D             //Paint Black or white
        
        @cont           //cont-1
        M=M-1

        @jump
        D=M

        @pscreen
        M=M+D

        @PAINT
        0;JMP

(END)
        @iscroos
        D=M
        @SETLINEH       //Checks if it hast to go cross D=M || M=0
        D;JEQ
        @INIT
        0;JMP