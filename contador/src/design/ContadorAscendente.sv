module ContadorAscendente #(parameter Maximacuenta = 28)(
  input logic clk,    // Entrada de reloj
  input logic rst,    // Entrada de reset asincrónico
  input logic enable, // Entrada de habilitación (activo en alto)
  output logic pulso, // Salida de pulso
  output logic [$clog2(Maximacuenta)-1:0]  count // Salida del contador (6 bits)
);

logic [$clog2(Maximacuenta)-1:0] counter;

always_ff @(posedge clk or posedge rst) begin
  if (rst) begin
    counter <= 0;
    pulso <= 0;
  end else if (enable) begin
    if (counter == Maximacuenta-1) begin
      counter <= 0;
      pulso <= 1;
    end else begin
      counter <= counter + 1;
      pulso <= 0;
    end
  end
end
assign count = counter;

endmodule

