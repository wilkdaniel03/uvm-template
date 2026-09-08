// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

class virtual_seqr extends uvm_sequencer #();
  `uvm_component_utils(virtual_seqr)

  uvm_sequencer #(item) seqr;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction
endclass : virtual_seqr
