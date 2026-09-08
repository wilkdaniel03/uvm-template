// Copyright (c) 2026 Daniel Wilk
// SPDX-License-Identifier: Apache-2.0

+incdir+../uvm/src
../uvm/src/uvm.sv

-F agent/filelist.f
+incdir+seq_lib
seq_lib/seq_lib_pkg.sv
test_pkg.sv
clk_if.sv
testbench.sv
