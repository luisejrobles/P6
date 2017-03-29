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

initmask:
ldi R23,0x80 /*MSB mask*/
ldi R22,0x01 /*LSB mask*/
ldi R2,0	 /*contador*/
/*========================= 
   MSB R27		LSB R26
   --------------------
   R10 MSBaux	R9 LSBaux
==========================*/
;------------- ciclo principal --------------------------------------
cpi R24,0
breq invR3031
/*---------Invertir R29-R28----------*/
mov R27,R29
mov r26,r28
jmp reverseBits

invR3031:
/*---------Invertir R31-R30----------*/
mov R27,R31
mov r26,R30

/*--------Procedimiento Reverse--------*/
reverseBits:
	mov R10,R27 /*MSB copia para comparaciones*/
	mov R9,R26  /*LSB copia para comparaciones*/
	inicioReverse:
	mov r8,r23 /*MSBmask copia*/
	mov r7,r22 /*LSBmask copia*/

	and R10,R23
	and R19	,R22

	/*haciendo corrimiento en la mascara*/
	lsr r23
	lsl r22

	cp R10,R19
	breq addContador
	/*se niegan los bits (complemento 1)*/
	com r8 
	com r7

	and r27,r8 
	and r26,r7
	addContador:
		inc r2
		cpi r2,7
		breq initmask




;--------------------------------------------------------------------
