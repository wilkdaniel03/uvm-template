// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

class vseq extends uvm_sequence;
  `uvm_object_utils(vseq)
  `uvm_declare_p_sequencer(virtual_seqr)

  seq seq_1;

  function new(string name = "");
    super.new(name);
  endfunction

  virtual task pre_body();
    seq_1 = seq#()::type_id::create("seq_1");
  endtask

  virtual task body();
    seq_1.start(p_sequencer.seqr);
  endtask
endclass : vseq
