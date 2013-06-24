
#ocamlmode.pdf: ocamlmode.tex#
#	pdflatex ocamlmode.tex

#view: ocamlmode.pdf
#	evince ocamlmode.pdf &

tuareg-mode.pdf: tuareg-mode.tex
	pdflatex tuareg-mode.tex

view: tuareg-mode.pdf
	evince tuareg-mode.pdf &

edit:
	emacs tuareg-mode.tex &

clean:
	rm -f *.bbl *.aux *.dvi *.ps *.log *~
