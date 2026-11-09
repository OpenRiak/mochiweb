REBAR ?= ../riak/rebar3

.PHONY: all edoc test clean build

all: build

build:
	@$(REBAR) compile

test: build
	@$(REBAR) eunit

edoc: build
	@$(REBAR) edoc

clean:
	@$(REBAR) clean
