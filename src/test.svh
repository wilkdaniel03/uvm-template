// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

class test extends uvm_test;
  `uvm_component_utils(test)

  env  m_env;
  vseq seq;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    m_env = env::type_id::create("m_env", this);
    seq   = vseq::type_id::create("seq");
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    seq.p_sequencer = m_env.vseqr;
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    phase.raise_objection(this);

    seq.start(m_env.vseqr);

    phase.drop_objection(this);
  endtask
endclass : test
