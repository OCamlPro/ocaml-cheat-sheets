all:
	$(MAKE) -C ocaml-lang
	$(MAKE) -C ocaml-tools
	$(MAKE) -C ocaml-stdlib
	$(MAKE) -C ocaml-libs
	$(MAKE) -C tuareg-mode
	$(MAKE) -C ocaml-c-api
	$(MAKE) -C ocaml-opam

clean:
	$(MAKE) clean -C ocaml-lang
	$(MAKE) clean -C ocaml-tools
	$(MAKE) clean -C ocaml-stdlib
	$(MAKE) clean -C ocaml-libs
	$(MAKE) clean -C tuareg-mode
	$(MAKE) clean -C ocaml-c-api
	$(MAKE) clean -C ocaml-opam
