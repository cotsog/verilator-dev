#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("./driver.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003-2007 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# General Public License or the Perl Artistic License.

$golden_out ||= "t/$Last_Self->{name}.out";

compile (
	 v_flags2 => [$Last_Self->{v3}?"--stats --O3 -x-assign fast":""],
	 );

execute (
	 check_finished=>1,
     );

ok(files_identical("obj_dir/$Last_Self->{name}_logger.log", $golden_out));

1;
