# Tablas de Hash - Ejercicio 1
Dada una secuencia de palabras se desea saber aquellas que aparecieron exactamente dos veces.

Restricciones: O(N) caso promedio en tiempo de ejecución.

## Formato de entrada
| Entrada     |
| ----------- |
| N           |
| palabra1    |
| palabra2    |
| ...         |
| palabraN    |

La primera línea indica la cantidad de palabras a leer. Las siguientes N líneas son el conjunto de palabras a trabajar.

## Formato de salida
La salida contendrá 1 línea, que es la cantidad de palabras que ocurrieron exactamente dos veces en el formato de entrada.

## Ejemplos
### Ejemplo 1
| Entrada     |
| ----------- |
| 7           |
| AAA         |
| BAB         |
| ABC         |
| AAA         |
| ABC         |
| BCA         |
| BBB         |

| Salida      |
| ----------- |
| 2           |

### Ejemplo 2
| Entrada     |
| ----------- |
| 4           |
| AAA         |
| AAA         |
| AAA         |
| BAC         |

| Salida      |
| ----------- |
| 0           |
