.PHONY: webmanual

IMAGES=orion swan swan1 swan2 pp3rose

%.pdf : %.pp3
	pp3 $<
	rm $*.eps

all: pp3.info.gz pp3.pdf pp3.html pp3/index.html

pp3.info: pp3.texi $(addsuffix .txt,$(IMAGES))
	LANG=en ; makeinfo --enable-encoding --no-split $<

pp3.html: pp3.texi $(addsuffix .png,$(IMAGES)) kariert.png pp3man.css
	LANG=en ; makeinfo --html --enable-encoding --no-split --css-include=pp3man.css $<

pp3/index.html: pp3.texi $(addsuffix .png,$(IMAGES)) kariert.png pp3man.css
	LANG=en ; makeinfo --html --enable-encoding --css-include=pp3man.css $<
	cp $(addsuffix .png,$(IMAGES)) kariert.png pp3/

pp3.info.gz: pp3.info
	cp -p pp3.info pp3.info~
	gzip $<
	mv pp3.info~ pp3.info

pp3.pdf: pp3.texi $(addsuffix .pdf,$(IMAGES)) title.pdf
	texi2pdf $<

webmanual: pp3.pdf pp3.html pp3/index.html
	cp -rp pp3 manual
	zip -9r pp3man.zip manual
	scp -C pp3.html pp3.sf.net:/home/groups/p/pp/pp3/htdocs/manual/
	scp pp3.pdf pp3.sf.net:/home/groups/p/pp/pp3/htdocs/manual/
	scp pp3man.zip pp3.sf.net:/home/groups/p/pp/pp3/htdocs/
	ssh bronger@shell.sf.net "cd /home/groups/p/pp/pp3/htdocs ; unzip -o pp3man.zip"
