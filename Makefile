.PHONY: test
test:
	go test -timeout 3m ./...

.PHONY: lint
lint:
	@if test ! -e ./bin/golangci-lint; then \
    	curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh; \
    fi
	@./bin/golangci-lint run --timeout 3m

.PHONY: build
build:
	go build

.PHONY: gen-docs
gen-docs: build
	@command -v cloudquery >/dev/null 2>&1 || { \
		echo "Error: 'cloudquery' command not found. Please install it before running gen-docs."; \
		echo "You can install it by following the instructions at: https://www.cloudquery.io/docs/quickstart"; \
		exit 1; \
	}
	rm -rf docs/tables
	cloudquery tables --format markdown --output-dir docs/ test/config.yml
	mv -vf docs/coinpaprika docs/tables

.PHONY: gen-mocks
gen-mocks:
	# go install github.com/golang/mock/mockgen
	rm -rf ./client/mocks/*
	go generate ./client/...

# All gen targets
.PHONY: gen
gen: gen-docs gen-mocks