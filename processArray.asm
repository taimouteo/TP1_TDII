; Usando la instruccion ADDINMEM, implementar la funcion processArray que toma un arreglos
; de enteros positivos en memoria y los suma de a pares en memoria, pisando el primer elemento
; de cada par con el resultado. Considerar que el tama-o del arreglo siempre es par.
;
;     processArray(*p,size)
;         for i=0; i<size/2; i=i+2
;             p[i] = p[i] + p[i+1]

main:
	SET R7, 0xFF  ; stack 
	SET R0, p  ; p
	SET R1, 0x10  ; size

	CALL |R7|, processArray
	
processArray:
	SHRA R1, 0x01  ; Dividir size entre 2 (size/2)

loop:
	PUSH |R7|, R0
	SET R0, 0x00
	CMP R1, R0  ; Comparar tamaño (size/2) con 0
	JZ halt  ; Si size/2 <= 0, termina el bucle
	POP |R7|, R0
	ADDINMEM R0  ; Sumar p[i] + p[i+1] y almacenar en p[i]
	PUSH |R7|, R1
	SET R1, 0x02
	ADD R0, R1  ; Avanzar el puntero (p) a la siguiente posición de dos en dos
	POP |R7|, R1
	PUSH |R7|, R0
	SET R0, 0x01
	SUB R1, R0  ; Restar 2 a size/2
	POP |R7|, R0
	JMP loop  ; Bucle a lo largo de la array

halt:
	JMP halt  ; Loop infinito

p:
	DB 0x01
	DB 0x02
	DB 0x04
	DB 0x08
	DB 0x03
	DB 0x03
	DB 0xA1
	DB 0xC0
	DB 0xFF
	DB 0x40
	DB 0x55
	DB 0xCC
	DB 0xBD
	DB 0x45
	DB 0x9A
	DB 0xEE