all:
	$(MAKE) -C ocaml-lang
	$(MAKE) -C ocaml-tools
	$(MAKE) -C ocaml-stdlib
	$(MAKE) -C ocaml-libs
	$(MAKE) -C tuareg-mode
	$(MAKE) -C ocaml-c-api
	$(MAKE) -C ocaml-opam

DIRS= ocaml-lang ocaml-tools ocaml-stdlib ocaml-libs tuareg-mode	\
  ocaml-c-api ocaml-opam

pages:
	for dir in $(DIRS); do cp -f $$dir/$$dir.pdf docs/; done
	cp -f ocaml-opam/ocaml-opam-bw.pdf docs/

clean:
	$(MAKE) clean -C ocaml-lang
	$(MAKE) clean -C ocaml-tools
	$(MAKE) clean -C ocaml-stdlib
	$(MAKE) clean -C ocaml-libs
	$(MAKE) clean -C tuareg-mode
	$(MAKE) clean -C ocaml-c-api
	$(MAKE) clean -C ocaml-opam
