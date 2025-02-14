-module(mochiweb_http_tests).

-include_lib("eunit/include/eunit.hrl").

has_acceptor_bug_test_() ->
    {setup, fun start_server/0, fun mochiweb_http:stop/1,
     fun has_acceptor_bug_tests/1}.

start_server() ->
    application:start(inets),
    {ok, Pid} = mochiweb_http:start_link([{port, 0},
					  {loop, fun responder/1}]),
    Pid.

has_acceptor_bug_tests(Server) ->
    Port = mochiweb_socket_server:get(Server, port),
    [{"1000 should be fine even with the bug",
      ?_assertEqual(false, (has_bug(Port, 1000)))},
     {"10000 should trigger the bug if present",
      ?_assertNot((has_bug(Port, 10000)))}].

responder(Req) ->
    mochiweb_request:respond({200,
			      [{"Content-Type", "text/html"}],
			      ["<html><body>Hello</body></html>"]},
			     Req).

has_bug(Port, Len) ->
    case httpc:request(get,
		       {"http://127.0.0.1:" ++ integer_to_list(Port) ++ "/",
			[{"X-Random", lists:duplicate(Len, $a)}]},
		       [], [])
	of
      {error, socket_closed_remotely} -> true;
      {ok,
       {{"HTTP/1.1", 200, "OK"}, _,
	"<html><body>Hello</body></html>"}} ->
	  false;
      {ok, {{"HTTP/1.1", 431, "Request Header Fields Too Large"}, _, []}} ->
      false
    end.