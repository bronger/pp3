.PHONY: webmanual

COREIMAGES=orion swan swan1 swan2 pp3rose leo1

%.pdf : %.pp3
	rm -f labeldimens.dat
	pp3 $<
#	rm $*.eps

all: pp3.info.gz pp3.html pp3/index.html pp3.pdf

title.pdf: title.pp3 manual.tex

pp3.info: pp3.texi $(addsuffix .txt,$(COREIMAGES))
	LANG=en ; makeinfo --enable-encoding --no-split $<

pp3.html: pp3.texi $(addsuffix .png,$(COREIMAGES)) kariert.png pp3man.css
	LANG=en ; makeinfo --html --enable-encoding --no-split --css-include=pp3man.css $<

pp3/index.html: pp3.texi $(addsuffix .png,$(COREIMAGES)) kariert.png pp3man.css
	rm -Rf pp3
	LANG=en ; makeinfo --html --enable-encoding --css-include=pp3man.css $<
	cp $(addsuffix .png,$(COREIMAGES)) kariert.png pp3/

pp3.info.gz: pp3.info
	cp -p pp3.info pp3.info~
	gzip --force $<
	mv pp3.info~ pp3.info

pp3.pdf: pp3.texi $(addsuffix .pdf,$(COREIMAGES)) title.pdf
	texi2pdf $<

webmanual: pp3.pdf pp3.html pp3/index.html
	rm -Rf manual
	cp -rp pp3 manual
	zip -9r pp3man.zip manual
	scp -C pp3.html pp3.sf.net:/home/groups/p/pp/pp3/htdocs/manual/
	scp pp3.pdf pp3.sf.net:/home/groups/p/pp/pp3/htdocs/manual/
	scp pp3man.zip pp3.sf.net:/home/groups/p/pp/pp3/htdocs/
	ssh bronger@shell.sf.net "cd /home/groups/p/pp/pp3/htdocs ; unzip -o pp3man.zip"
