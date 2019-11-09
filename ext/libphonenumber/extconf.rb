# frozen_string_literal: true

MAKEFILE_CONTENT =
  "build:
	GO111MODULE=on go build -buildmode=c-shared -o ../../lib/libphonenumber/libphonenumber.so libphonenumber.go
# fake out clean and install
clean:
install:

.PHONY: build"

open('Makefile', 'w') { |f| f.write(MAKEFILE_CONTENT) }
