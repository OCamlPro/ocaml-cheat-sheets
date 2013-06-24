
ocaml-tools.pdf: ocaml-tools.tex
	pdflatex ocaml-tools.tex

view: ocaml-tools.pdf
	evince ocaml-tools.pdf &

edit:
	emacs ocaml-tools.tex &

clean:
	rm -f *.bbl *.aux *.dvi *.ps *.log *~
