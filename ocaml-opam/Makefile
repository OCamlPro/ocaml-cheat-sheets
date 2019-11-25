
FILE=ocaml-opam

all: $(FILE).pdf $(FILE)-bw.pdf

%.pdf: %.tex ../common/ocaml-cs.cls
	pdflatex $*.tex

$(FILE)-bw.tex: $(FILE).tex
	sed '1 s/colcode/nbcode/' $(FILE).tex > $(FILE)-bw.tex

view: $(FILE).pdf
	evince $(FILE).pdf &

edit:
	emacs $(FILE).tex &

clean:
	rm -f *.bbl *.aux *.dvi *.ps *.log *~
