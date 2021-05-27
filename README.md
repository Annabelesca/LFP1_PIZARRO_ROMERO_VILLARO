<h1><p align="center"># Analizador léxico en FLEX</p></h1>
<h2><p align="center">Pràctica 1. Llenguatges formals</p></h1>

## 1. Enunciado
La definición de un autómata finito (AF) viene dada por un alfabeto, unos estados, unas transiciones, un estado inicial y unos estados finales. El alfabeto (∑) es un conjunto finito de símbolos. Los estados están representados por números enteros sin signo 0, 1, 2, etc. Las transiciones son de la forma (A, B; C) donde A y C son dos números enteros sin signo representando cada uno un estado del AF y B es un símbolo del alfabeto. 

Se propone utilizar una notación textual de representación de AFs siguiendo el esquema siguiente:

```
% Autómata Finito

Alfabeto {símbolo, símbolo, …}

Estados {num}

Transiciones {(num, símbolo; num), …}

Inicial {num}

Finales {num, …}
```
Se pide, por tanto, construir un Analizador Léxico con FLEX que (1) identifique los tokens (palabras reservadas) **alfabeto, estados, transiciones, inicial y final**. Es necesario que, para estos tokens, no haga distinciones entre mayúsculas y minúsculas; así debe reconocer como token alfabeto las cadenas: alfabeto, Alfabeto, ALFABETO, AlFaBeTo, alfaBETO, …

También se pide (2) identificar enteros sin signo (num), como identificadores de los estados del AF, (3) las claves de abrir (i.e., {) y cerrar (i.e., }) se asociaran a los tokens ABRIR y CERRAR, respectivamente; así como (4) cualquier símbolo alfabético {a, b, c, …, z, A, B, C, …, Z} y numérico {0, 1, 2, …, 9} se asociarán al token SIMBOLO. Se pide también (5) el reconocimiento del formato de transición (num, símbolo; num).

El sistema (6) debe ser capaz de saltarse los comentarios. Éstos serán textos inicializados con % y que perduran hasta el siguiente final de línea. Tener en cuenta que (7) todos los espacios en blanco, tabuladores y otros signos de control adicionales que deseéis considerar deben ser saltados sin que el sistema produzca un error. Por último, (8) se deben calcular el número de estados que aparecen en la parte de Estados.

## 2. ESTRUCTURA DE LA PRÁCTICA
### 2.1 Identificación de tokens:
Definimos una constante para cada uno de los tokens (alfabeto, estados, transiciones, inicial y final). Dicha constante permitirá reconocer al token tanto si está escrito en mayúsculas como en minúsculas ya que permite leer cada letra por separado en forma de mayúscula o minúscula. Un ejemplo de definición para el token INICIAL sería: [Ii] [Nn] [Ii] [Cc] [Ii] [Aa] [Ll]

### 2.2 Identificación de enteros sin signo:
Definimos una constante num para identificar los enteros sin signo.

### 2.3 Identificación llaves abrir y cerrar: { y } 
Definimos una expresión regular que se corresponda con { para “ABRIR” y otra que se corresponda con } para cerrar.

### 2.4 Identificación de símbolos alfabéticos y numéricos: 
Definimos una expresión regular que se corresponda con { para “ABRIR” y otra que se corresponda con } para cerrar.

### 2.5 Identificación de transiciones:
Definimos una expresión regular que se corresponda con { para “ABRIR” y otra que se corresponda con } para cerrar.

### 2.6 Identificación de espacios en blanco y tabuladores: 
Definimos una expresión regular que se corresponda con { para “ABRIR” y otra que se corresponda con } para cerrar.

### 2.7 Identificación de comentarios 
Definimos una expresión regular para detectar las líneas que empiezan por resultado (en cuyo caso, el analizador léxico las ignora) y otra para detectar el comentario al final de línea (en cuyo caso se hace un salto de línea)

## 3. JUEGO DE PRUEBAS
Para hacer este juego de pruebas nos hemos basado en AF del ejercicio 38e del PDF de ejercicios recomendados: 

L  = {w pertenece a Z*: totes les as en w es troben entre dues bs}. 

<p align="center">
  <img alt="Figura 1.Esquema automata juego de pruebas" src="">
</p>

Utilizaremos la siguiente notación para representar este AF con el que haremos las pruebas pertinentes para comprobar el correcto funcionamiento de nuestro analizador léxico:

ALFABETO { a , b }

ESTADOS { 4 }

TRANSICIONES { (0 , a ; 3), (0 , b ; 1), (1 , a ; 2), (1 , b ; 1), (2 , a ; 3), (2, b ; 1), (3 , a ; 3), (3, b ; 3) }

INICIAL { 0 }

FINALES { 0, 1 }

Para las pruebas, haremos pequeñas modificaciones en estas notaciones:

INSERTAR JUEGO DE PRUEBAS
