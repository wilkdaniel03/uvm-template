// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

class driver extends uvm_driver #(item);
  `uvm_component_utils(driver)

  virtual clk_if vif;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual clk_if)::get(uvm_root::get(), "", "vif", vif)) begin
      `uvm_error(get_full_name(), "Failed to get vif")
    end
  endfunction

  virtual task run_phase(uvm_phase phase);
    item it;
    super.run_phase(phase);

    forever begin
      vif.wait_clks(1);
      seq_item_port.get_next_item(it);
      `uvm_info(get_full_name(), $sformatf("data = %x", it.data), UVM_INFO)
      seq_item_port.item_done(it);
    end
  endtask
endclass : driver
