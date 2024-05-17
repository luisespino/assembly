# Guía para ejecutar la consola de Arch Linux en Android AARCH32

Requisitos: Tener cualquier télefono que tenga un procesador Cortex-A35 en adelante o un Snapdragon Series 2 en adelante.

1. Instalar la aplicación UserLAnd

2. Al ejecutarla hacer clic en la distribución Arch

3. Configurar para ejecutar en terminal

4. Utilizar nano para crear un archivo en lenguaje ensamblador, por ejemplo, test.s

> nano test.s
```
.global _start
_start:
  mov x0, 5
  mov x8, 93
  svc 0

```
5. Ensamblar, enlazar y ejecutar el archivo test.
