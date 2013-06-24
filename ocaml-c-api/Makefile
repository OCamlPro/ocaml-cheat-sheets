FILE=ocaml-c-api

$(FILE).pdf: $(FILE).tex
	pdflatex $(FILE).tex

view: $(FILE).pdf
	evince $(FILE).pdf &

clean:
	rm -f *.bbl *.aux *.dvi *.ps *.log *~
