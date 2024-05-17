# Guía para ejecutar la consola de Raspberry Pi OS ARM64 en QEMU
**(usando Raspberry Pi 3b)**
**(Se puede utilizar ya sea Windows, Linux o MAC)**


1. Descargar e instalar la última versión de [QEMU](https://www.qemu.org/download/)
   
<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/qemu-raspios/img/qemudownload.JPG" width="400" >
</p>

2. Descargar la imagen comprimida de [Raspberry Pi OS](https://www.raspberrypi.com/software/operating-systems/) Lite de 64 bits

<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/qemu-raspios/img/qemuraspios.jpg" width="400" >
</p>

3. Descomprimir la imagen y colocarla en una nueva carpeta
4. Descargar y dejar en la misma carpeta el archivo [DTB](https://farabimahmud.github.io/emulate-raspberry-pi3-in-qemu/bcm2710-rpi-3-b-plus.dtb) adecuado para la versión de Raspberry Pi 3b+ (Device Tree Blob)
5. Descargar y dejar en la misma carpeta el archivo de la imagen del [Kernel](https://farabimahmud.github.io/emulate-raspberry-pi3-in-qemu/kernel8.img)
6. Crear en la misma carpeta un archivo bat o sh con el siguiente comando y parámetros (en Linux cambiar el ^ por \\ y ajustar la ruta)

```
"c:\Program Files\qemu\qemu-system-aarch64.exe" ^
  -M raspi3b ^
  -cpu cortex-a53 ^
  -m 1G -smp 4 ^
  -kernel kernel8.img ^
  -sd raspios.img  ^
  -dtb bcm2710-rpi-3-b-plus.dtb ^
  -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200
  dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" ^
  -serial stdio ^
  -usb -device usb-mouse -device usb-kbd ^
  -device usb-net,netdev=net0 ^
  -netdev user,id=net0,hostfwd=tcp::5555-:22

echo QEMU is finished
pause
```

7. Ejecutar el batch
<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/qemu-raspios/img/qemu1.JPG" width="400" >
</p>

8. Cuando esté listo el emulador, instalar el sistema operativo con el usuario deseado y luego hacer login.
<p align="center">
<img src="https://github.com/luisespino/assembly/blob/main/qemu-raspios/img/qemu3.JPG" width="400" >
</p>
