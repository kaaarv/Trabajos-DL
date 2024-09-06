
module ContadorAscendente_tb;

    // Numero maximo a contar
    parameter Maximacuenta = 28;

    // Señales de prueba
    logic clk_tb = 0;
    logic rst_tb = 0;
    logic enable_tb = 1; 
    logic [$clog2(Maximacuenta)-1:0] count_tb;

    // Instancia del ContadorDescendente
    ContadorAscendente #(Maximacuenta) u_contador (
        .clk(clk_tb),
        .rst(rst_tb),
        .enable(enable_tb),
        .count(count_tb)
    );

    // Generador de clock
    always begin
        #5 clk_tb = ~clk_tb; // Cambio de flanco cada 5 unidades de tiempo
    end

    // Generador de reset
    initial begin
        rst_tb = 1;
        #10 rst_tb = 0; // Aplicar el reset después de 10 unidades de tiempo
    end

    initial begin
        $dumpfile("ContadorAscendente_tb.vcd"); 
        $dumpvars(0, ContadorAscendente_tb);   

    end

    initial begin
        $display("Iniciando simulación del ContadorAscendente");

        // Ciclo de prueba
        for (int i = 1; i <= Maximacuenta ; i=i+1) begin
           // Registrar el valor del contador por cada cambio de reset
            #10; 
            $display("count = %d", count_tb);
        end
         #100;

        $finish;
    end

endmodule