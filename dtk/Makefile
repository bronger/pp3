dtk.pdf: dtk.tex dtk_pp3.tex dtk_pp3.bib leo.pdf sco.pdf pp3rose.pdf
	pdflatex dtk
	bibtex dtk
	pdflatex dtk
	pdflatex dtk

leo.pdf: leo.pp3 wiki.pp3 wiki.tex
	pp3 leo.pp3

sco.pdf: sco.pp3 wiki.pp3 wiki.tex
	pp3 sco.pp3

sco-grey.pdf: sco-grey.pp3 wiki.pp3 wiki.tex
	pp3 sco-grey.pp3

leo.eps: leo.pp3 wiki.pp3 wiki.tex
	pp3 leo.pp3

sco.eps: sco.pp3 wiki.pp3 wiki.tex
	pp3 sco.pp3

sco-grey.eps: sco-grey.pp3 wiki.pp3 wiki.tex
	pp3 sco-grey.pp3

