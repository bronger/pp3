IMAGES=orion swan swan1 swan2 pp3rose

%.pdf : %.pp3
	pp3 $<

%.pdf : %.eps
	ps2pdf $<

all: pp3.info.gz pp3.pdf pp3.html pp3/index.html

pp3.info: pp3.texi $(addsuffix .txt,$(IMAGES))
	LANG=en ; makeinfo --enable-encoding --no-split $<

pp3.html: pp3.texi $(addsuffix .png,$(IMAGES)) pp3man.css
	LANG=en ; makeinfo --html --enable-encoding --no-split --css-include=pp3man.css $<

pp3.info.gz: pp3.info
	cp -p pp3.info pp3.info~
	gzip $<
	mv pp3.info~ pp3.info

pp3.pdf: pp3.texi $(addsuffix .pdf,$(IMAGES)) title.pdf
	texi2pdf $<
