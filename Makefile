.PHONY: ci compile test

ci: compile test

compile:
	mix deps.get
	mix compile

test:
	mix test
