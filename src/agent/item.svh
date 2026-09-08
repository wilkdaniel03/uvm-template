// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

class item #(
    parameter int WIDTH = 32
) extends uvm_sequence_item;
  rand bit [WIDTH-1:0] data;

  `uvm_object_param_utils_begin(item)
    `uvm_field_int(data, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name = "");
    super.new(name);
  endfunction
endclass : item
