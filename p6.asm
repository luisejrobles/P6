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
;------------- ciclo principal --------------------------------------

cpi R24,0
breq cero
uno: 
	inc R24
	cpi R24,10
	rjmp uno
cero: 
	dec R24
	cpi R24,0
	rjmp cero
otro:

;--------------------------------------------------------------------
