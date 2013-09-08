PDF_VIEWER = evince

ocaml-libs.pdf: ocaml-libs.tex
	pdflatex ocaml-libs.tex

view: ocaml-libs.pdf
	$(PDF_VIEWER) ocaml-libs.pdf

clean:
	rm -f *.bbl *.aux *.dvi *.ps *.log *~
