// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns / 1ps

module testbench;
  import uvm_pkg::*;

  logic clk;

  clk_if vif (.clk_i(clk));

  always #1 clk = ~clk;

  initial begin
    uvm_config_db#(virtual clk_if)::set(uvm_root::get(), "", "vif", vif);
    run_test("test");
  end
endmodule : testbench
