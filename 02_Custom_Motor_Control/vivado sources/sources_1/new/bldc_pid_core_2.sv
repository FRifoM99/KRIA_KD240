`timescale 1ns / 1ps

module bldc_pid_core_2 (
    input  logic        clk,              
    input  logic        rst,              
    input  logic [2:0]  hall_code,        
    input  logic [9:0]  duty_cycle,       // velocidad entregada por el PID del PS 
    
    output logic        phaseA,
    output logic        phaseB,
    output logic        phaseC,
    output logic [21:0] hall_period       // tiempo medido entre pasos para calcular RPM en el PS
);

    logic motor_pwm;
    logic [9:0] pwm_counter;

    //PWM 
    always_ff @(posedge clk) begin
        if (rst) begin
            pwm_counter <= 10'd0;
            motor_pwm   <= 1'b0;
        end else begin
            if (pwm_counter >= 10'd1023) begin
                pwm_counter <= 10'd0;
            end else begin
                pwm_counter <= pwm_counter + 1'b1;
            end
            
            // si el contador es menor que el ciclo de trabajo, la salida es alta
            motor_pwm <= (pwm_counter < duty_cycle) ? 1'b1 : 1'b0;
        end
    end

    //Conmutación 
    always_ff @(posedge clk) begin
        if (rst) begin
            phaseA <= 1'bz;
            phaseB <= 1'bz;
            phaseC <= 1'bz;
        end else begin
            case (hall_code)
                3'd1 : begin
                    phaseA <= 1'bz;
                    phaseB <= 1'b0;
                    phaseC <= motor_pwm;
                end
                3'd2 : begin
                    phaseA <= 1'b0;
                    phaseB <= motor_pwm;
                    phaseC <= 1'bz;
                end
                3'd3 : begin
                    phaseA <= 1'b0;
                    phaseB <= 1'bz;
                    phaseC <= motor_pwm;
                end
                3'd4 : begin
                    phaseA <= motor_pwm;
                    phaseB <= 1'bz;
                    phaseC <= 1'b0;
                end
                3'd5 : begin
                    phaseA <= motor_pwm;
                    phaseB <= 1'b0;
                    phaseC <= 1'bz;
                end
                3'd6 : begin
                    phaseA <= 1'bz;
                    phaseB <= motor_pwm;
                    phaseC <= 1'b0;
                end
                default : begin
                    phaseA <= 1'bz;
                    phaseB <= 1'bz;
                    phaseC <= 1'bz;
                end
            endcase
        end
    end

    // retroalimentación del PID
    logic [2:0]  hall_code_prev;
    logic [21:0] period_counter;

    always_ff @(posedge clk) begin
        if (rst) begin
            hall_code_prev <= 3'd0;
            period_counter <= 22'd0;
            hall_period    <= 22'd0;
        end else begin
            hall_code_prev <= hall_code;
            
            if (hall_code != hall_code_prev) begin
                hall_period    <= period_counter; // guarda el último período medido
                period_counter <= 22'd0;          // reinicia el contador 
            end else begin
                if (period_counter < 22'h3FFFFF) begin
                    period_counter <= period_counter + 1'b1;
                end else begin
                    hall_period    <= 22'h3FFFFF; // fuerza saturación para indicar RPM = 0 (detenido) al procesador
                end
            end
        end
    end

endmodule