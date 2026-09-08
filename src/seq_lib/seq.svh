// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

class seq #(
    parameter int SIZE = 10
) extends uvm_sequence #(item);
  `uvm_object_utils(seq)

  function new(string name = "");
    super.new(name);
  endfunction

  virtual task body();
    item it;
    it = item#()::type_id::create("item");

    for (int i = 0; i < SIZE; i++) begin
      start_item(it);
      assert (it.randomize());
      finish_item(it);
    end
  endtask
endclass : seq
