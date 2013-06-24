all:
	$(MAKE) -C ocaml-lang
	$(MAKE) -C ocaml-tools
	$(MAKE) -C ocaml-stdlib
	$(MAKE) -C tuareg-mode
	$(MAKE) -C ocaml-c-api
	$(MAKE) -C ocaml-opam
