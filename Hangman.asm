                      .MODEL SMALL
 
.STACK 100H

.DATA
a db 1,2,3,4,5
b db 5 dup(?)
c db "Enter 2 to use custom and Enter any other key to use pre defined word $" 
d db "Name of an Animal with 5 Letters $"
e db 5 dup(?)
f db "Name of a Fruit with 5 Letters $"
g db 5 dup(?)
h db "Name of a Country with 5 Letters $"
i db 5 dup(?)
j db "Name of a Capital with 5 Letters $"
k db 5 dup(?)
l db "Name of a Food with 5 Letters $"
m db 5 dup(?)
w1 db "[Wr]$"
e1 db "PANDA $"
g1 db "GUAVA $"
i1 db "CHINA $"
k1 db "TOKYO $"
m1 db "SALAD $"
word db "Insert a word $"
underscores db "_____$"
predef db 0
loop1 db 0
row db 0   
column db 0
row1 db 0   
column1 db 0
row2 db 0   
column2 db 0 
points db 0
total db 0
array db 10 dup(?)   
scoreline DB "Total Score is : ", "$" 
empty db 5 dup(?)
topic0 db "Choose Topic #For Animal press 0#For Fruit press 1#For Country press 2#For Capital press 3#For Food press 4#Insert a number:&"

;astar db "******$" 
part1 DB "    +---+ ", 0DH, 0AH, "$"      ; Top bar
part2 DB "    |   | ", 0DH, 0AH, "$"      ; Vertical bar with top support
part3 DB "    O   | ", 0DH, 0AH, "$"      ; Head
part4 DB "   /|\  | ", 0DH, 0AH, "$"      ; Arms and body
part5 DB "   / \  | ", 0DH, 0AH, "$"      ; Legs
base  DB "        | ", 0DH, 0AH, "=========", 0DH, 0AH, "$" ; Base and ground  

.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX


 
; enter your code here  

start_Aikhane:

;Choose either to use predefined values or you want to enter
mov ah,09h
lea dx,c
int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
mov ah,01h
int 21h


cmp al,32h   ;2 er sathe compare kore

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
je custom
jmp predefined
 

custom:    ;Custom choose korle aikhane ashbe

mov bh,02h    ;Custom er jonne bh 02 banabo

;Animal 
mov ah,02h  ;Nicher namlam ek line
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov cx,5
mov si,0


mov ah,09h   ;Write a name ai line print
lea dx,d
int 21h
mov ah,02h   ;Tarpor abar namlam akline
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h


Animalloop:     ;input naoar loop

mov ah,01
int 21h

Animalcheck:    

Animalboro:      ;check kori input letter vul naki  means letter na naki
cmp al,41h
jge niche        ;
jmp wrong         ;vul hoile niche
                  
niche:
cmp al,5Ah       
jle niche2:      ;boro haater
jg greater

greater:         
cmp al,61h
jge niche3       

niche3:
cmp al,7Ah     ;check kori borohater naki choto haater
jle update     ;choto haater
jmp wrong

update:
sub al,20h
jmp niche2     ;boro haater word a convert korlam

niche2:
                ;5 ta letter nilam
mov e[SI],al
inc si
jmp loopshesh

wrong:

mov ah,09h
lea dx,w1
int 21h
jmp animalloop 

loopshesh:



loop animalloop

;printanimal:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;printanimalloop:
;mov dl,e[si]
;mov ah,02h
;int 21h
;inc si
;
;loop printanimalloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h



;#################Animal Loop Shesh ###########################   




;33333333333333333333333FRUIT33333333333333333333333333333333333


mov cx,5
mov si,0


mov ah,09h
lea dx,f
int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h



Fruitloop: 

mov ah,01
int 21h

Fruitlcheck:

Fruitlboro:
cmp al,41h
jge Fruitniche
jmp Fruitwrong

fruitniche:
cmp al,5Ah
jle Fruitniche2:
jg Fruitgreater

fruitgreater:
cmp al,61h
jge Fruitniche3

fruitniche3:
cmp al,7Ah
jle Fruitupdate
jmp Fruitwrong

Fruitupdate:
sub al,20h
jmp Fruitniche2

Fruitniche2:

mov g[SI],al
inc si
jmp Fruitloopshesh

Fruitwrong: 
mov ah,09h
lea dx,w1
int 21h
jmp Fruitloop 

Fruitloopshesh:



loop Fruitloop

;printFruit:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;printFruitloop:
;mov dl,g[si]
;mov ah,02h
;int 21h
;inc si
;
;loop printFruitloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h 


;333333333333333333______Fruit Loop Shesh______33333333333333333333333333333333333            


;_______________________COUNTRY START ___________________________



mov cx,5
mov si,0


mov ah,09h
lea dx,h
int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h


Countryloop: 

mov ah,01
int 21h

Countrycheck:

Countryboro:
cmp al,41h
jge Countryniche
jmp Countrywrong

Countryniche:
cmp al,5Ah
jle Countryniche2:
jg Countrygreater

Countrygreater:
cmp al,61h
jge Countryniche3

Countryniche3:
cmp al,7Ah
jle Countryupdate
jmp Countrywrong

Countryupdate:
sub al,20h
jmp Countryniche2

Countryniche2:

mov i[SI],al
inc si
jmp Countryloopshesh

Countrywrong: 
mov ah,09h
lea dx,w1
int 21h
jmp Countryloop 

Countryloopshesh:



loop Countryloop

;printCountry:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;printCountryloop:
;mov dl,i[si]
;mov ah,02h
;int 21h
;inc si
;
;loop printCountryloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h  

;333333333333333333______Country Loop Shesh______33333333333333333333333333333333333            


;_______________________Capital START ___________________________  


mov cx,5
mov si,0


mov ah,09h
lea dx,j
int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h


Capitalloop: 

mov ah,01
int 21h

Capitalcheck:

Capitalboro:
cmp al,41h
jge Capitalniche
jmp Capitalwrong

Capitalniche:
cmp al,5Ah
jle Capitalniche2:
jg Capitalgreater

Capitalgreater:
cmp al,61h
jge Capitalniche3

Capitalniche3:
cmp al,7Ah
jle Capitalupdate
jmp Capitalwrong

Capitalupdate:
sub al,20h
jmp Capitalniche2

Capitalniche2:

mov k[SI],al
inc si
jmp Capitalloopshesh

Capitalwrong: 
mov ah,09h
lea dx,w1
int 21h
jmp Capitalloop 

Capitalloopshesh:



loop Capitalloop

;printCapital:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;printCapitalloop:
;mov dl,k[si]
;mov ah,02h
;int 21h
;inc si
;
;loop printCapitalloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h  


;333333333333333333______Capital Loop Shesh______33333333333333333333333333333333333            


;_______________________Food START ___________________________ 



mov cx,5
mov si,0


mov ah,09h
lea dx,l
int 21h
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h


FOODloop: 

mov ah,01
int 21h

FOODcheck:

FOODboro:
cmp al,41h
jge FOODniche
jmp FOODwrong

FOODniche:
cmp al,5Ah
jle FOODniche2:
jg FOODgreater

FOODgreater:
cmp al,61h
jge FOODniche3

FOODniche3:
cmp al,7Ah
jle FOODupdate
jmp FOODwrong

FOODupdate:
sub al,20h
jmp FOODniche2

FOODniche2:

mov m[SI],al
inc si
jmp FOODloopshesh

FOODwrong: 
mov ah,09h
lea dx,w1
int 21h
jmp FOODloop 

FOODloopshesh:



loop FOODloop
mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h


;printFOOD:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;printFOODloop:
;mov dl,m[si]
;mov ah,02h
;int 21h
;inc si
;
;loop printFOODloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h    

; enough poriman space dicchi jeno uporer input gula show na kore shei jonne 



mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,02h
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h


 


jmp gamestart 

;#######__________ALL CUSTOM INPUT FINISH_________#####   






predefined:     ;Pre define choose korar por aikhane ashe
mov predef,1
;
;mov bh,01h
;
;;pre defined animal 
;
;preprintanimal:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;preprintanimalloop:
;mov dl,e1[si]
;mov ah,02h
;int 21h
;inc si
;
;loop preprintanimalloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;;pre defined fruit
;preprintfruit:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;preprintfruitloop:
;mov dl,g1[si]
;mov ah,02h
;int 21h
;inc si
;
;loop preprintfruitloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;;pre defined country
;preprintcountry:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;preprintcountryloop:
;mov dl,i1[si]
;mov ah,02h
;int 21h
;inc si
;
;loop preprintcountryloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;;pre defined capital
;preprintcapital:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;preprintcapitalloop:
;mov dl,k1[si]
;mov ah,02h
;int 21h
;inc si
;
;loop preprintcapitalloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;;pre defined food
;preprintfoodt:
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;
;mov cx,05
;mov si,0
;
;preprintfoodloop:
;mov dl,m1[si]
;mov ah,02h
;int 21h
;inc si
;
;loop preprintfoodloop
;mov ah,02h
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
;

gamestart:  
;Replace:
;    ; Move cursor to the start of the line
;    MOV AH, 02H
;    MOV BH, 0      ; Video page
;    MOV DH, 1      ; Row 0
;    MOV DL, 0      ; Column 0
;    INT 10H
;    
;    MOV AH, 09H
;    LEA DX, astar
;    INT 21H 

;##############Topic CHoose korar lekha ta############
    
choosetopic:     ;topic choose korar jayga ashe 
mov si,0
printstate:  ;er moddhe topic choose er 5 ta line instruction prin hoy
mov ah,02
mov dl,topic0[si]
cmp dl,26h   ;check kore jodi & chinno pay tokhon shey loop theke ber hoye jay
je outstate
cmp dl,23h
je space ;check kore # chinno paile niche jaya baame jay
aita:
int 21h
inc si
jmp printstate

space:
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
jmp aita

outstate:

jounrainput: ;jounra input nitese
mov ah,01h
int 21h 
cmp al,30h
jl invalid
cmp al,34h
jg invalid
mov bl,al 
mov ah,02h 
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h
mov al,39h
mov total,al
jmp topichose 

invalid:
mov ah,02
mov dl,08h;backspace    
int 21h 
mov dl,20h ;''
int 21h
mov dl,08h 
int 21h

jmp jounrainput





topichose: ;cl a jounra ase


cmp bh,02h  ;check kortese je konta choose korsilo
je customchoosen      ;oi onujayi custom ba predef a dhuktese
jmp predefinedchoosen

customchoosen:  ;aikhane ashar aage bl a ase jounra
cmp bl,30h
je choosenjounraanimal
cmp bl,31h                        ;aikhane jounra onujayi porer move ta choose kortese
je choosenjounrafruit
cmp bl,32h
je choosenjounracountry
cmp bl,33h
je choosenjounracapital
cmp bl,34h
je choosenjounrafood

predefinedchoosen:
cmp bl,30h
je choosenjounraanimal1
cmp bl,31h
je choosenjounrafruit1
cmp bl,32h
je choosenjounracountry1
cmp bl,33h
je choosenjounracapital1
cmp bl,34h
je choosenjounrafood1    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
choosenjounraanimal:
mov cx,05
mov si,0
innerloop:
    mov bl,e[si]
    push bx
    inc si
loop innerloop
jmp nichecholo
choosenjounrafruit:
mov cx,05
mov si,0
innerloop4:
    mov bl,g[si]
    push bx
    inc si
loop innerloop4
jmp nichecholo
choosenjounracountry:
mov cx,05
mov si,0
innerloop1:
    mov bl,i[si]
    push bx
    inc si
loop innerloop1
jmp nichecholo
choosenjounracapital:
mov cx,05
mov si,0
innerloop2:
    mov bl,k[si]
    push bx
    inc si
loop innerloop2
jmp nichecholo
choosenjounrafood:
mov cx,05
mov si,0
innerloop3:
    mov bl,m[si]
    push bx
    inc si
loop innerloop3
jmp nichecholo



choosenjounraanimal1:
mov cx,05
mov si,0
innerloop10:
    mov bl,e1[si]
    push bx
    inc si
loop innerloop10
jmp nichecholo
choosenjounrafruit1:
mov cx,05
mov si,0
innerloop11:
    mov bl,g1[si]
    push bx
    inc si
loop innerloop11
jmp nichecholo
choosenjounracountry1:
mov cx,05
mov si,0
innerloop12:
    mov bl,i1[si]
    push bx
    inc si
loop innerloop12
jmp nichecholo
choosenjounracapital1:
mov cx,05
mov si,0
innerloop13:
    mov bl,k1[si]
    push bx
    inc si
loop innerloop13
jmp nichecholo
choosenjounrafood1:
mov cx,05
mov si,0
innerloop14:
    mov bl,m1[si]
    push bx
    inc si
loop innerloop14
jmp nichecholo


nichecholo:
mov cx,05
mov si,04
berkoro:
    pop bx
    mov empty[si],bl
    dec si
loop berkoro

;lastprint:
;mov cx,05
;mov si,0
;printkoro:
;    mov ah,02
;    mov dl,empty[si]
;    int 21h
;    inc si
;loop printkoro
 
mov ah,02
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mainpartofthegame:

mov ah,09h
lea dx,underscores
int 21h
mov ah,02
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h

mov ah,09h
lea dx,word
int 21h 
mov ah,02
mov dl,0Ah
int 21h
mov dl,0Dh
int 21h



mov di,00    ;Total Attempt
mov sp,00
mov cl,00h  ;Koyta Right
mov ch,00h    ;Koytar sathe match check korse
mov bp,00    ;Koyta Bhul
inputnilam:
cmp cl,05
je baire
push cx
MOV AH, 03H      ; Function to get cursor position
    MOV BH, 0        ; Video page number
    INT 10H
mov ax,bp
cmp al,05
je baire    
mov ah,01h
int 21h 
pop cx
mov ch,00h

mov bl,al
cmp bl,61h
jl baad
cmp bl,7Ah
jg baad
jmp borokori
borokori:
sub bl,20h

baad: 


mov si,00   ;5 counter index
mov al,00h

loopermoddhecheck:
    ;jmp draw
    inc al
    mov bh,empty[si] 
    inc si 
    CMP CL, 05H 
    JE baire
    cmp bl,bh
    je equalre
    jmp equalnare 
equalnare:
    inc ch 
    ;cmp ch,01
;    je draw1
;    cmp ch,02
;    je draw2
;    cmp ch,03
;    je draw3
;    cmp ch,04
;    je draw4
;    cmp ch,05
;    je draw5
;    shesheraage:
    jmp shesh1
    
equalre:
    inc cl
    Push Cx
    MOV AH, 03H     
    MOV BH, 0        
    INT 10H         

    
    MOV row, DH      
    MOV column, DL
    Replace:
   
    MOV AH, 02H
    MOV BH, 0      ; Video page
    MOV DH, row
    SUB DH,02      ; Row 0
    MOV DL, 0      ; Column 0
    INT 10H
    
    
    PUSH Ax
    MOV AH, 09H
    mov underscores[si-1],bl
    LEA DX, underscores
    INT 21H
    
    
    
    POP Ax
    Pointer_Update:
    MOV AH, 02H        ; Function to set cursor position      
    MOV DH, row         ; Restore saved row
    MOV DL, column       ; Restore saved column
    INT 10h
    Pop Cx
    mov ch,0h
    

shesh1:
cmp al,05h
jne loopermoddhecheck
cmp ch,05h
je drawing
back:
mov ch,00h
mov ax,di
cmp al,10
je baire
inc di
jmp inputnilam 


drawing:

push cx 

mov ah,total
sub ah,2h
mov total,ah

MOV AH, 03H      ; Function to get cursor position
MOV BH, 0        ; Video page number
INT 10H

 

inc bp 
mov cx,bp

cmp cl,01
je draw1
cmp cl,02
je draw2
cmp cl,03
je draw3
cmp cl,04
je draw4
cmp cl,05
je draw5
mov cl,00h
back2:
pop cx
jmp back


draw1:
     
    
    MOV AH, 03H     
    MOV BH, 0        
    INT 10H          

    
    MOV row1, DH      
    MOV column1, DL
    Replace1:
   
    
    
    PUSH Ax
     
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
           
           
    
    MOV AH, 09H
    LEA DX, part1
    INT 21H 
    MOV AH, 09H
    
    
    POP Ax 
    Pointer_Update1:
    mov ah,predef
    cmp ah,01
    je prere1
    jmp notprere1
    prere1:
    MOV AH, 02H        ; Function to set cursor position      
    MOV DH, row1       ; Restore saved row
    MOV DL, column1      
    INT 10h
    jmp back2
    
    MOV AH, 03H      
    MOV BH, 0        
    INT 10H
    notprere1:
    MOV AH, 02H        ; Function to set cursor position      
    MOV DH, row1
    sub dh,8       ; Restore saved row
    MOV DL, column1       ; Restore saved column
    INT 10h
    jmp back2
    
    MOV AH, 03H      
    MOV BH, 0        
    INT 10H

jmp back2
     
     
draw2:
    
    MOV AH, 03H      ; Function to get cursor position
    MOV BH, 0        
    INT 10H          ; Call BIOS interrupt

   
    MOV row1, DH      
    MOV column1, DL
    Replace2:
    
    
    
    PUSH Ax
     
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    MOV AH, 09H
    LEA DX, part2
    INT 21H 
    MOV AH, 09H
    
    
    POP Ax 
    Pointer_Update2:
    mov ah,predef
    cmp ah,01
    je prere2
    jmp notprere2
    prere2:
    MOV AH, 02H             
    MOV DH, row1       
    MOV DL, column1      
    INT 10h
    jmp back2
    
    MOV AH, 03H      
    MOV BH, 0      
    INT 10H
    notprere2:
    MOV AH, 02H              
    MOV DH, row1 
    sub dh,1      
    MOV DL, column1       
    INT 10h
    jmp back2
    
    MOV AH, 03H     
    MOV BH, 0        
    INT 10H
    
 jmp back2

draw3:
    
    MOV AH, 03H     
    MOV BH, 0        
    INT 10H         

    
    MOV row1, DH      
    MOV column1, DL
    Replace3:
   
    
    
    PUSH Ax
     
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    MOV AH, 09H
    LEA DX, part3
    INT 21H 
    MOV AH, 09H
    
    
    POP Ax 
    Pointer_Update3:
    mov ah,predef
    cmp ah,01
    je prere3
    jmp notprere3
    prere3:
    MOV AH, 02H            
    MOV DH, row1       
    MOV DL, column1       
    INT 10h
    jmp back2
    
    MOV AH, 03H      
    MOV BH, 0        ; Video page number
    INT 10H
    notprere3:
    MOV AH, 02H         ;set cursor position      
    MOV DH, row1 
    sub dh,1      ; saved row
    MOV DL, column1      ; saved column
    INT 10h
    jmp back2
    
    MOV AH, 03H      ; cursor position
    MOV BH, 0        ; 
    INT 10H
    
 jmp back2
draw4:

    
    MOV AH, 03H      ;t cursor position
    MOV BH, 0        ; 
    INT 10H          ;  BIOS interrupt

    
    MOV row1, DH      ; Save row
    MOV column1, DL
    Replace4:
    
    
    
    PUSH Ax
     
    mov ah,02
    mov dl,0Ah
    int 21h 
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    MOV AH, 09H
    LEA DX, part4
    INT 21H 
    MOV AH, 09H
    
    
    POP Ax 
    Pointer_Update4:
    mov ah,predef
    cmp ah,01
    je prere4
    jmp notprere4
    prere4:
    MOV AH, 02H        ; set cursor position      
    MOV DH, row1       ;  saved row
    MOV DL, column1       ; saved column
    INT 10h
    jmp back2
    
    MOV AH, 03H      ; cursor position
    MOV BH, 0        
    INT 10H
    notprere4:
    MOV AH, 02H        ; cursor position      
    MOV DH, row1 
    sub dh,1      
    MOV DL, column1       
    INT 10h
    jmp back2
    
    MOV AH, 03H      
    MOV BH, 0        
    INT 10H
 jmp back2
draw5:
     
    MOV AH, 03H      
    MOV BH, 0        
    INT 10H          

    
    MOV row1, DH      
    MOV column1, DL
    Replace5:
    
    
    
    PUSH Ax
     
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    
    mov ah,02
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    MOV AH, 09H
    LEA DX, part5
    INT 21H 
    
    MOV AH, 09H
    LEA DX, base
    INT 21H 
    
    MOV AH,09H
    
    
    POP Ax 
    Pointer_Update5:
     mov ah,predef
    cmp ah,01
    je prere5
    jmp notprere5
    prere5:
    MOV AH, 02H             
    MOV DH, row1       
    MOV DL, column1       
    INT 10h
    jmp back2
    
    MOV AH, 03H      ;  cursor position
    MOV BH, 0        ; 
    INT 10H
    notprere5:
    MOV AH, 02H        ;  cursor position      
    MOV DH, row1 
    sub dh,1      ;  saved row
    MOV DL, column1       ;  saved column
    INT 10h
    jmp back2
    
    MOV AH, 03H      ; cursor position
    MOV BH, 0        
    INT 10H
    
jmp back2


baire:
    mov ah,02
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    MOV AH, 09H
    LEA DX, scoreline
    INT 21H 
    mov al,total
    add al,01h
    mov total,al
    mov dl,al
    cmp dl,3Ah
    je score_top:
    mov ah,02h
    int 21h
    jmp exit:
    score_top:
    
    mov ah,02h
    mov dl,31h
    int 21h
    mov dl,30h
    int 21h
    exit:      
                
                       
                       
                       
                       
            




 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN  





