# Guía para ejecutar la consola de Arch Linux ARM64 en Android

**Requisitos: Tener cualquier télefono que tenga un procesador Cortex-A35 en adelante o un Snapdragon Series 2 en adelante para que tengan soporte de 64 bits.**

1. Instalar la aplicación UserLAnd

<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/android-archlinux/img/userland1.jpg" width="400" >
</p>

2. Al ejecutarla hacer clic en la distribución Arch (ya que está distribución trae más comandos instalados)

<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/android-archlinux/img/userland2.jpg" width="150" >
</p>

3. Configurar para ejecutar en terminal y esperar que descargue los archivos y termine de instalar 

<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/android-archlinux/img/userland3.jpg" width="200" >
</p>

4. En consola, ejecutar nano para crear un archivo en lenguaje ensamblador, por ejemplo, test.s

<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/android-archlinux/img/userland4.jpg" width="300" >
</p>

> nano test.s

```
.global _start
_start:
  mov x0, 5
  mov x8, 93
  svc 0

```

<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/android-archlinux/img/userland5.jpg" width="200" >
</p>

5. Finalmente, ensamblar, enlazar y ejecutar el archivo test.

```
as -o test.o test.s
ld -o test test.o
./test ; echo $?
```
<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/android-archlinux/img/userland6.jpg" width="300" >
</p>
