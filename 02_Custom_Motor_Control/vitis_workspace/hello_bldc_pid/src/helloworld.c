#include "platform.h"
#include "xil_io.h"
#include "xgpio.h"
#include "sleep.h"

// Constantes hardware xparameters.h
#define BLDC_AXI_BASE_ADDR   XPAR_BLDC_AXI_CTRL_0_BASEADDR 
// #define MOTOR_ENA_DEVICE_ID  XPAR_MOTOR_ENA_DEVICE_ID
#define MOTOR_ENA_DEVICE_ID  XPAR_MOTOR_ENA_BASEADDR

#define REG0_DUTY_CYCLE_OFF  0x0  
#define REG1_HALL_PERIOD_OFF 0x4  

#define CLK_FREQ_HZ          100000000.0f 
#define POLES                8.0f         

XGpio GpioMotorEnable;

typedef struct {
    float kp, ki, kd;
    float integral, prev_error;
} PID_Controller;

void pid_init(PID_Controller *pid, float kp, float ki, float kd) {
    pid->kp = kp; 
    pid->ki = ki; 
    pid->kd = kd;
    pid->integral = 0.0f; 
    pid->prev_error = 0.0f;
}

float pid_calculate(PID_Controller *pid, float setpoint, float current_val, float dt) {
    float error = setpoint - current_val;
    
    // Proporcional
    float p_term = pid->kp * error;
    
    // Integral con Anti-Windup basico
    pid->integral += error * dt;
    float i_term = pid->ki * pid->integral;
    if (i_term > 1023.0f) { i_term = 1023.0f; pid->integral -= error * dt; }
    if (i_term < 0.0f) { i_term = 0.0f; pid->integral -= error * dt; }
    
    // Derivativo
    float d_term = pid->kd * ((error - pid->prev_error) / dt);
    pid->prev_error = error;
    
    float output = p_term + i_term + d_term;
    if (output > 1023.0f) output = 1023.0f;
    if (output < 0.0f) output = 0.0f;
    
    return output;
}

int main() {
    init_platform();
    PID_Controller pid;
    
    // Inicializar habilitador del motor
    XGpio_Initialize(&GpioMotorEnable, MOTOR_ENA_DEVICE_ID);
    XGpio_SetDataDirection(&GpioMotorEnable, 1, 0x00000000); 
    
    // Sintonizacion PID y consigna de velocidad
    pid_init(&pid, 0.4f, 0.08f, 0.01f);
    float target_rpm = 1500.0f; 
    float sample_time = 0.01f;   
    
    // Arranque inicial
    Xil_Out32(BLDC_AXI_BASE_ADDR + REG0_DUTY_CYCLE_OFF, 150); 
    XGpio_DiscreteWrite(&GpioMotorEnable, 1, 1);                    
    
    while(1) {
        // Leer ticks de hardware
        u32 period_ticks = Xil_In32(BLDC_AXI_BASE_ADDR + REG1_HALL_PERIOD_OFF);
        float current_rpm = 0.0f;
        
        // Calcular RPM reales (0x3FFFFF indica saturacion / motor detenido)
        if (period_ticks > 0 && period_ticks < 0x3FFFFF) {
            current_rpm = (CLK_FREQ_HZ / (float)period_ticks) * (60.0f / (6.0f * (POLES / 2.0f)));
        } else {
            current_rpm = 0.0f;
        }

        // Ejecutar lazo de control y actualizar ciclo de trabajo
        float control_output = pid_calculate(&pid, target_rpm, current_rpm, sample_time);
        Xil_Out32(BLDC_AXI_BASE_ADDR + REG0_DUTY_CYCLE_OFF, (u32)control_output);
        
        usleep(10000); 
    }

    cleanup_platform();
    return 0;
}