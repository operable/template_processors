.PHONY: compile test

compile:
	mix deps.get
	mix compile

test:
	mix test
