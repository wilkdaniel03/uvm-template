// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

class agent extends uvm_agent;
  `uvm_component_utils(agent)

  uvm_sequencer #(item) seqr;
  driver drv;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    seqr = uvm_sequencer#(item)::type_id::create("seqr", this);
    drv  = driver::type_id::create("driver", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass : agent
