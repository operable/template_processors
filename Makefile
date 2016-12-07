.PHONY: buildkite ci compile test

buildkite:
	docker build .

ci: compile test

compile:
	mix deps.get
	mix compile

test:
	mix test
