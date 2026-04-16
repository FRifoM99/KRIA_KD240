# Parte 1: Getting Started con BLDCs (KD240)

Esta carpeta contiene los archivos necesarios para ejecutar la primera parte del tutorial de puesta en marcha.

## 📂 Estructura de Archivos

### 1. `Sources/`
Contiene la definición del hardware para el proyecto en Vivado:
* **Diseño de Block Diagram:** Archivos correspondientes al diseño de bloques de Vivado.
* **Archivo de Constraints:** Definición de pines para la KD240.
* **Archivos Verilog:** Código fuente de la lógica programable.

### 2. `vitis_workspace/`
Se incluye la carpeta completa del espacio de trabajo de Vitis necesaria para el desarrollo del software. Para poder replicar el tutorial, el archivo fundamental es:
* [helloworld.c](./vitis_workspace/hello_bldc/src/helloworld.c): Contiene la lógica principal en C para realizar las pruebas iniciales de giro del motor.

### 3. Archivo Wrapper (.xsa)
Se incluye el archivo **XSA** exportado desde el proyecto de diseño de Vivado. Este archivo es el que vincula la arquitectura de hardware con el entorno de software en Vitis.

---

## 🔗 Referencia
* [Tutorial Original - Hackster.io](https://www.hackster.io/whitney-knitter/getting-started-with-bldcs-on-kria-kd240-motor-kit-part-1-c18318)
* [Explicación motores BLDC](https://www.reddit.com/r/Motors/comments/m89473/bldc_motor_controller_how_it_works_design/)
