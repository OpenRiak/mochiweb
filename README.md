MochiWeb is an Erlang library for building lightweight HTTP servers.

![Mochiweb OpenRiak Status](https://github.com/OpenRiak/mochiweb/actions/workflows/erlang.yml/badge.svg?branch=openriak-3.2)

The latest version of MochiWeb is available at https://github.com/mochi/mochiweb

The mailing list for MochiWeb is at https://groups.google.com/group/mochiweb/

Erlang OTP is required for setting up the MochiWeb environment and is available at https://www.erlang.org/

To create a new mochiweb using project see the `example_project` in the `examples/` folder.

Information about Rebar (Erlang build tool) is available at https://github.com/erlang/rebar3

MochiWeb is currently tested with Erlang/OTP 18.3 through 24.0,
versions older than 3.0.0 may still be compatible back to R15B-03.

# OTP 21.2, 21.2.1, 21.2.2 warning

OTP 21.2 (up to and including 21.2.2) introduced an SSL regression that
makes these releases unsafe to use. See [ERL-830](https://bugs.erlang.org/browse/ERL-830).
This issue was resolved in OTP 21.2.3.
