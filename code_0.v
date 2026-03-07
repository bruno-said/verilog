// Declaração de um módulo e portas
module MeuModulo(input entrada, output saida);
  // Lógica do módulo
endmodule

// Exemplo de módulo declarando todos os tipos de portas
module io_example (
  input        clk,       // Fio de entrada (1 bit)
  input        reset_n,   // Fio de entrada (1 bit)
  input  [7:0] data_in,   // Barramento de entrada (8 bits)
  output [7:0] data_out,  // Barramento de saída de (8 bits)
  output       ready,     // Fio de saída de (1 bit)
  inout  [3:0] bus_shared // Barramento bidirecional (4 bits)
);
  // Lógica do módulo
endmodule

// Exemplo de módulo utilizando 'parameter'
module parameter_example #(
  parameter N = 8
)(
  input          clk,         // Fio de entrada (1 bit)
  input          reset_n,     // Fio de entrada (1 bit)
  input  [N-1:0] data_in,     // Barramento de entrada (N bits)
  output [N-1:0] data_out,    // Barramento de saída de (N bits)
  output         ready,       // Fio de saída de (1 bit)
  inout  [3:0]   bus_shared   // Barramento bidirecional (4 bits)
);
  // Lógica do módulo
endmodule

// Exemplo de módulo utilizando declarações 'wire' e 'reg'
module wire_reg_example #(
  parameter N = 8
)(
  input  wire         clk,         // Fio de entrada (1 bit)
  input  wire         reset_n,     // Fio de entrada (1 bit)
  input  wire [N-1:0] data_in,     // Barramento de entrada (N bits)
  output reg  [N-1:0] data_out,    // Barramento de saída de (N bits)
  output wire         ready,       // Fio de saída de (1 bit)
  inout  wire [3:0]   bus_shared   // Barramento bidirecional (4 bits)
);
  // Lógica do módulo
endmodule

// Submódulo: inverterVector
module inverterVector #(
  parameter WIDTH = 2 // Largura configurável
)(
  input  wire [WIDTH-1:0] A, // Entrada do submódulo
  output wire [WIDTH-1:0] Y  // Saída do submódulo
);
  assign Y = ~A; // Inversão bit a bit
endmodule

// Usando associação por nome
module name_example #(
  parameter N = 8
)(
  input  wire         clk,
  input  wire         reset_n,
  input  wire [N-1:0] data_in, // Entrada utilizada no submódulo
  output reg  [N-1:0] data_out,
  output wire         ready,
  inout  wire [3:0]   bus_shared
);
  // Fio interno para receber a saída do submódulo 
  wire [N-1:0] inv_int;
  
  // Instância do submódulo
  inverterVector #(.WIDTH(N)) u_inverter (
    .A (data_in), // porta A <- data_in
    .Y (inv_int)  // porta Y -> inv_int
  );
endmodule

// Testando 'assign'
module assign0_example();
  wire button;
  wire led;
  assign led = button;
endmodule

// 'assign' com constantes
module assign1_example();
  wire [3:0] const1;
  wire [7:0] const2;
  assign const1 = 4'b1010;
  assign const2 = 8'hFF;
endmodule

// Testanto '_', 'x' e 'bz'
module example #(
  parameter N = 8
)(
  input  wire         clk,
  input  wire         reset_n,
  input  wire [N-1:0] data_in,
  input  reg  [N-1:0] data_out,
  output wire         ready,
  inout  wire [3:0]   bus_shared
);
  wire [7:0] a;
  wire [3:0] b;
  
  assign a = 8'b1001_0011;  // Utilizando _ para legibilidade
  assign b = 8'hAx;         // 4 último bits desconhecido (x)
  assign bus_shared = 4'bz; // Barramento em alta impedância
endmodule
