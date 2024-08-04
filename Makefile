ROOT_DIR := $(CURDIR)
export ROOT_DIR

.PHONY: install
install:
	$(MAKE) -C codegen install

.PHONY: generate_c
generate_c:
	$(MAKE) -C codegen generate_c
