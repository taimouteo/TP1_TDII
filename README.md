Trabajo Práctico 1, Tecnología Digital II.

Alumnos: Bautista Goya, Timo Doeswijk, Federico Del Cuadro.

Ejercicio 2:
Ensamblar y ejecutar - Escribir el siguiente archivo, compilarlo y cargarlo en la memoria de la máquina:

a) Previamente a ejecutar el programa, describir con palabras el comportamiento esperado del mismo. No se debe explicar instrucción por instrucción, la idea es entender que hace el programa y qué resultado genera.
Solución:
El programa compara dos valores de registros, aumentando en +1 el valor del primero, hasta que ambos llegan al mismo valor (0x70). Cuando no se cumple la condición de que sean iguales el programa, utilizando la pila y otros registros, almacena valores decrecientes en las direcciones de memoria correspondientes al registro que aumenta su valor, comenzando por 0xAF (en la dirección 0x50) y terminando con el valor 0x90 (en la dirección 0x6F). Cuando ambos registros comparados son 0, es decir, son iguales, el programa ejecuta la función JZ (la flag Z está encendida) al espacio de memoria con la etiqueta fin, y como los valores de memoria de fin son 0xA0 y 0x00 (10100000 en binario), se ejecuta la función JMP nuevamente (opcode: 10100) a la dirección de memoria 0x00.

b) Identificar la dirección de memoria de cada una de las etiquetas del programa.
Solución:
main: [0x00]; 
aca: [0x0a]; 
coso2: [0x14];
fin: [0x20];
halt: [0x22].

c) Ejecutar e identificar de ser posible cuantos ciclos de clock son necesarios para que el programa llegue a la instrucción JMP halt.
Solución:
No es posible ya que nunca llega al halt por lo explicado anteriormente (punto “a”).

d) ¿Cuántas microinstrucciones son necesarias para ejecutar la instrucción ADD? ¿Cuántas para la instrucción JZ? ¿Cuántas para la instrucción JMP?
Solución:
ADD: 4 microinstrucciones;
JZ: 2 microinstrucciones;
JMP: 1 microinstrucción.
	
e) ¿El programa utiliza la pila?, ¿Qué datos son almacenados en la pila?
Solución:
Sí, en la pila es almacenado el valor inicial del registro R0, el cuál fue establecido en 0x00. El valor del registro se introduce en la pila (con la instrucción PUSH) y, luego de realizar operaciones con este registro y cambiar su valor, se ejecuta la instrucción POP y vuelve a tener el valor previo.

f) Describir detalladamente el funcionamiento de las instrucciones PUSH, POP, CALL y RET.
Solución:
PUSH |Rx|, Ry: Almacena el valor de Ry en la dirección apuntada por Rx, el cuál es utilizado como puntero de la pila (por convención R7). Luego, resta 0x01 al valor de Rx lo cuál hace que apunte a la dirección de memoria anterior a la que apuntaba y que ese lugar sea el nuevo tope de la pila.

POP |Rx|, Ry: Retira el último valor almacenado en la pila (uno debajo del puntero) y lo sobreescribe en Ry. También cambia el valor del registro utilizado como puntero sumándole 1 y haciendo que apunte a la dirección de memoria siguiente.

CALL |Rx|,...
…Ry: El valor actual de PC (instrucción próxima a realizar) es enviado a la pila en la dirección apuntada por Rx, el puntero es retrocedido una posición y el valor de Ry es enviado al PC
…M: ídem al anterior, solo que en lugar de Ry funciona con un valor inmediato.

RET |Rx|: Opuesto al funcionamiento de CALL, asigna al PC el valor de la memoria en la posición de Rx y avanza el puntero de Rx.

Ejercicio 3:
Ampliando la máquina - Agregar las siguientes nuevas instrucciones:

Solución:
La solución del ejercicio fue adjuntada en el archivo ADDINMEM.zip, el cual contiene los siguientes 4 archivos:
ADDINMEM.ops: implementación de la microinstrucción ADDINMEM por separado.
microOps_v2.ops: implementación de la microinstrucción ADDINMEM en conjunto con el resto de las microinstrucciones del procesador.
microOps_v2.mem: archivo de memoria con las instrucciones del procesador (incluyendo ADDINMEM), el cuál debe ser cargado en la memoria de la unidad de control para su funcionamiento en logisim.
assembler_v2.py: Archivo assembler.py modificado que incluye a la nueva microinstrucción.

Ejercicio 4:
Programar - Escribir en ASM las siguientes funciones:

Solución:
La solución del ejercicio fue adjuntada en el archivo processArray.zip, el cual contiene los siguientes 3 archivos:
processArray.asm: función processArray escrita en el lenguaje ensamblador, con instrucciones permitidas para el procesador.
processArray.mem: archivo de memoria con las instrucciones codificadas correspondientes a la función, el cual se carga en la memoria RAM para el funcionamiento del programa.
processArray.txt: archivo de texto con las instrucciones en ensamblador del programa y sus direcciones de memoria.
