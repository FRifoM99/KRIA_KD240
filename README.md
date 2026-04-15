# KRIA_KD240
Este repositorio contiene recursos y archivos de diseño para trabajar con la Kria KD240 Drives Starter Kit. El objetivo es facilitar el flujo de trabajo inicial y compartir implementaciones de control de motores BLDC.

---

## 🧠 Introducción a la Familia Kria SoM

La línea **Kria** de AMD/Xilinx utiliza el concepto de **System on Module (SoM)**. A diferencia de las FPGAs tradicionales, un SoM integra el procesador (**PS**), la lógica programable (**PL**), memoria DDR y gestión de energía en un módulo compacto (K24/K26) que se monta sobre una *Carrier Card* (KD240/KV260/KR260).

### 📊 Comparativa Técnica: K24 (KD240) vs K26 (KV260/KR260)

El SoM **K24** es físicamente más pequeño (aprox. la mitad de tamaño) y está optimizado para eficiencia energética en aplicaciones industriales y control de movimiento.

| Característica | Kria K24 (KD240) | Kria K26 (KV260/KR260) |
| :--- | :--- | :--- |
| **MPSoC Core** | Zynq UltraScale+ (XCK24) | Zynq UltraScale+ (XCK26) |
| **Lógica (System Logic Cells)** | ~154K | ~256K |
| **CLB Slices** | 17,280 | 28,800 |
| **Memoria DDR** | 2GB LPDDR4 (64-bit) | 4GB LPDDR4 (64-bit) |
| **DSP Slices** | 432 | 1,248 |
| **Eficiencia** | Alta eficiencia, ideal para control/DSP. | Alto rendimiento para Visión e IA. |

---

## 🛠️ Contenido del Repositorio

### 1. `01_Getting_Started_BLDC/`
Contiene los archivos base para la **Parte 1** del tutorial de Whitney Knitter. Es el punto de partida para verificar que el hardware y las herramientas de software están correctamente configuradas.
* 🔗 [Tutorial Parte 1 - Hackster.io](https://www.hackster.io/whitney-knitter/getting-started-with-bldcs-on-kria-kd240-motor-kit-part-1-c18318)

### 2. `02_Custom_Motor_Control/`
Archivos de un control de motor basado en el tutorial mencionado. Es una implementación funcional para entender la interacción entre la lógica programable y el driver del motor.

> [!CAUTION]
> **Advertencia de Seguridad y Eficiencia:**
> Al igual que se menciona en el tutorial original, este diseño es **estrictamente una prueba de funcionamiento**. El tipo de modulación utilizado no es el más eficiente para un motor BLDC. 
> * **Efecto:** El motor y los drivers tienden a **calentarse considerablemente** tras un par de minutos de uso continuo. 
> * **Recomendación:** No dejar el motor encendido por periodos prolongados con este esquema de control.

---

## ⚠️ Notas de Versión y Troubleshooting

Durante el desarrollo en **Vitis/Vivado 2024.1** de la [Parte 2 del tutorial](https://www.hackster.io/whitney-knitter/getting-started-with-bldcs-on-kria-kd240-motor-kit-part-2-fb5ee0) se encontraron dificultades al intentar habilitar las *Accelerated Libraries* referenciadas en la sección *Create PetaLinux Project*.

Se recomienda revisar con cuidado y trabajar con las mismas versiones de Ubuntu y Petalinux que el tutorial.

---

## 🔗 Referencias y Enlaces de Interés

### Tutoriales y Comunidad
* **Whitney Knitter (Hackster.io):** [Vivado 2023.2 Setup](https://www.hackster.io/whitney-knitter/getting-started-with-the-kria-kd240-in-vivado-2023-2-561401) | [Vitis Unified IDE](https://www.hackster.io/whitney-knitter/getting-started-with-the-kria-kd240-in-vitis-unified-2023-2-00c2ab) | [Accelerated Apps](https://www.hackster.io/whitney-knitter/accelerated-app-development-on-kria-kd240-in-vitis-2023-2-374fc7)
* [Element14 Community - Kria KD240 Events](https://community.element14.com/learn/events/c/e/1706#) - Recursos y webinars sobre el kit de motores.
* [HWLibre - Info sobre AMD Kria K24](https://www.hwlibre.com/amd-kria-k24-zynq-ultrascale/) - Resumen de características en español.

### Documentación Oficial de AMD/Xilinx
* [UG1093 (User Guide)](https://docs.amd.com/r/en-US/ug1093-kd240-starter-kit/Summary) | [DS984 (Data Sheet)](https://docs.amd.com/r/en-US/ds984-kd240-starter-kit/Summary)
* [Aplicación FOC (Oficial): GUI Deployment](https://xilinx.github.io/kria-apps-docs/kd240/foc-motor-ctrl/0_4/build/html/docs/app_deployment.html) | [Hardware Description](https://xilinx.github.io/kria-apps-docs/kd240/foc-motor-ctrl/0_5/build/html/docs/hw_description.html)
* [MicroZed Chronicles - Intro to KD240](https://www.adiuvoengineering.com/post/microzed-chronicles-introducing-the-kria-k24-som-and-the-kd240-drives-starter-kit)
