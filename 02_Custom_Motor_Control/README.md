# 02_Custom_Motor_Control - Control PID de Motor BLDC en Kria KD240

Este proyecto implementa un sistema de control de velocidad en lazo cerrado para un motor Brushless DC (BLDC) utilizando la tarjeta de desarrollo AMD Kria KD240. El diseño divide las tareas: la conmutación se ejecuta en el hardware (PL) mediante un ciclo de trabajo (PWM) controlado por registros, mientras que el algoritmo PID de velocidad se ejecuta en el procesador (PS).

## Estructura del Proyecto

* **`vivado_sources/`**: Archivos de diseño de hardware necesarios para replicar el proyecto en Vivado, incluyendo el Diagrama de Bloques, restricciones de pines (`.xdc`) y el núcleo del controlador (`bldc_pid_core_2.sv`).
* **`vitis_workspace/`**: Código fuente de software necesario para reproducir la plataforma de control en Vitis, incluyendo el archivo de exportación de hardware (`.xsa`) con el bitstream embebido y el firmware de control (`helloworld.c`).


---

## Instrucciones para replicar

