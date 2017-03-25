;------------- definiciones e includes ------------------------------
.equ INIT_VALUE = 0 ; Valor inicial R24
;------------- inicializar ------------------------------------------
ldi R24,INIT_VALUE
;------------- ciclo principal --------------------------------------
arriba: 
	inc R24
	cpi R24,10
	breq abajo
	rjmp arriba
abajo: 
	dec R24
	cpi R24,0
	breq arriba
	rjmp abajo
;--------------------------------------------------------------------
