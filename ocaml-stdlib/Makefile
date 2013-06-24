
ocaml-stdlib.pdf: ocaml-stdlib.tex
	pdflatex ocaml-stdlib.tex

view: ocaml-stdlib.pdf
	evince ocaml-stdlib.pdf &

clean:
	rm -f *.bbl *.aux *.dvi *.ps *.log *~
