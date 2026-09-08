// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

class env extends uvm_env;
  `uvm_component_utils(env)

  virtual_seqr vseqr;
  agent agnt;

  virtual clk_if vif;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual clk_if)::get(uvm_root::get(), "", "vif", vif)) begin
      `uvm_error(get_full_name(), "Failed to get vif")
    end

    vseqr = virtual_seqr::type_id::create("vseqr", this);
    agnt  = agent::type_id::create("agent", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    vseqr.seqr = agnt.seqr;
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
endclass : env
