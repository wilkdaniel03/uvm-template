// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

interface clk_if (
    input logic clk_i
);

  logic sck;
  logic sd;

  task wait_clks(int num);
    for (int i = num; i > 0; i--) begin
      @(posedge clk_i);
    end
  endtask
endinterface : clk_if
