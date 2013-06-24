
FILE=ocaml-opam

$(FILE).pdf: $(FILE).tex
	pdflatex $(FILE).tex

view: $(FILE).pdf
	evince $(FILE).pdf &

edit:
	emacs $(FILE).tex &

clean:
	rm -f *.bbl *.aux *.dvi *.ps *.log *~
