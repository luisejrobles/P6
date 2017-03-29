;********************************************
;*   Universidad Autonoma de Baja California*
;*    Microprocesadores y Microcontroladores*
;*											*
;*                  Practica 6				*
;*Jimenez Robles Luis Eduardo				*
;*01208396									*
;********************************************

;------------- definiciones e includes ------------------------------
.equ INIT_VALUE = 0 ; Valor inicial R24
;------------- inicializar ------------------------------------------
ldi R24,INIT_VALUE
ldi R28,0xE6 ;1110 0110
ldi R29,0x55 ;0101 0101
ldi R30,0xAA ;1010 1010
ldi R31,0xFF ;1111 1111
/*========================= 
   MSB R27		LSB R26
   --------------------
   R10 MSBaux	R9 LSBaux
==========================*/
;------------- ciclo principal --------------------------------------
inicio:
cpi R24,0
breq invR3031
cpi r24,1
breq invR2928
nada:
jmp inicio
/*---------Invertir R29-R28----------*/
invR2928:
mov R27,R29
mov r26,r28
jmp reverseBits

invR3031:
/*---------Invertir R31-R30----------*/
mov R27,R31
mov r26,R30

initMaskCont:
ldi R15,0  /*contador*/
ldi R23,0x80 /*MSB mask*/
ldi R22,0x01 /*LSB mask*/

/*--------Procedimiento Reverse--------*/
reverseBits:
	inc r15 /*incrementando contador*/

	mov R10,R27 /*MSB copia para comparaciones*/
	mov R9,R26  /*LSB copia para comparaciones*/
	inicioReverse:
	mov r8,r23 /*MSBmask copia*/
	mov r7,r22 /*LSBmask copia*/

	and R10,R23 /*verificando status bit*/
	and R19	,R22 /*verificando status*/

	lsr R23 /*corrimiento en MSBmask*/
	lsl R22 /*corrimiento en LSBmask*/

	cp R10,R19
	breq addContador

	com r8 /*negando MSBmask complemento1*/
	com r7 /*negando LSBmask complemento1*/
	and r27,r8 /*aplicando invert bit a MSB*/
	and r26,r7 /*aplicando invert bit a LSB*/
	addContador:
		cpi r15, 8
		breq initMaskCont
		jmp reverseBits




;--------------------------------------------------------------------
