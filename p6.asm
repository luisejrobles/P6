;*********************************************
;*   Universidad Autonoma de Baja California *
;*    Microprocesadores y Microcontroladores *
;*											 *
;*                  Practica 6				 *
;*Jimenez Robles Luis Eduardo				 *
;*01208396									 *
;*********************************************
;------------- definiciones e includes ------------------------------
.equ INIT_VALUE = 3 ;
;------------- inicializar ------------------------------------------
ldi R24,INIT_VALUE ;0 invierte R31-R30(Z)       1 invierte R29-R28(Y)
ldi R31,0xB0 ;1111 1111
ldi R30,0xB0 ;1010 1010
ldi R29,0xC0 ;0101 0101
ldi R28,0xCA ;1110 0110
/*===========================
Registros usados
	R31,0xFF ;1111 1111
	R30,0xAA ;1010 1010
	R29,0x55 ;0101 0101
	R28,0xE6 ;1110 0110

	R27 [MSBmask]
	R26 [LSBmask]

	R25 [Counter]
	R24,INIT_VALUE [0 invierte R31-R30] [1 invierte R29-R28]

	R23 [MSB] entrada funcion
	R22 [LSB] entrada funcion

	R21 [MSBaux] pruebas bits
	R20 [LSBaux] pruebas bits
===========================*/
validando:
	cpi R24,0
	breq inv3130
	cpi R24,1
	breq inv2928
nada:
jmp validando

inv3130:
	mov R23,R31
	mov R22,R30
	jmp initReverse
inv2928:
	mov R23,R29
	mov R22,R28

initReverse:
	ldi R27,0x80 ;MSBmask
	ldi R26,0x01  ;LSBmask
	ldi R25,0x00 ;Init counter
reverseByte:
	inc R25
	mov R21,R23 ;MSB para pruebas 
	mov R20,R22 ;LSB para pruebas

	and R21,R27 
	and R20,R26
	
	cpi R21,1	//Comparando si el bit seleccionado es 0 o 1
	brsh MSBvalor
	jmp MSBcero
MSBvalor:
	cpi R20,1
	brsh recorreMascaras
	jmp invertirBit
MSBcero:
	cpi R20,0
	breq recorreMascaras

invertirBit:
	;======NO SON IGUALES=========
	eor R23,R27 ;negando bit diferente
	eor R22,R26 ;negando bit diferente
recorreMascaras:
	lsr R27	;recorriendo MSBmask
	lsl R26 ;recorriendo LSBmask
	cpi R25,8
	breq meteRegistros
	jmp reverseByte
;Metiendo a registros correspondientes
meteRegistros:
	cpi R24,1
	breq meteY
	meteZ:
		mov R31,R23
		mov R30,R22
		jmp initReverse
	meteY:
		mov R29,R23
		mov R28,R22
		jmp initReverse
