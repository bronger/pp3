.PHONY: distri distri-cripple distri-linux distri-win all doc

DATADIR=\"/usr/local/share/pp3/\"


all: pp3

doc: pp3.pdf

%.cc : %.w
	$(CTANGLE) $* - $@

%.dvi : %.w
	$(CWEAVE) $*
	$(TEX) $*

pp3: pp3.cc
	$(CXX) -DDATADIR=$(DATADIR) pp3.cc -s -O2 -o pp3

pp3.pdf: pp3.w
	$(CWEAVE) pp3.w
	pdftex pp3.tex

pp3.ps: pp3.dvi
	dvips pp3
	psselect -p_1,_,1-_2 pp3.ps pp3_.ps
	mv pp3_.ps pp3.ps

pp3.ps.gz: pp3.dvi
	make pp3.ps
	gzip -f pp3.ps

DISTRINAME= pp3-1.1

distri:
	rm -f $(DISTRINAME).tar.bz2
	rm -Rf $(DISTRINAME)
	mkdir $(DISTRINAME)
	make pp3.cc
	make pp3.ps
	cp pp3.w pp3.cc fmax.ch pp3.ps $(DISTRINAME)
	cp COPYING Makefile $(DISTRINAME)
	cp stars.dat milkyway.dat nebulae.dat lines.dat boundaries.dat \
	  $(DISTRINAME)
	mkdir $(DISTRINAME)/examples
	cp wiki/*.pp3 wiki/wiki.tex $(DISTRINAME)/examples
	tar -cf $(DISTRINAME).tar $(DISTRINAME)
	bzip2 $(DISTRINAME).tar

distri-cripple:
	rm -f $(DISTRINAME)-cripple.tar.gz
	rm -Rf $(DISTRINAME)-cripple
	make distri
	rm $(DISTRINAME)/milkyway.dat $(DISTRINAME)/pp3.w \
	  $(DISTRINAME)/nebulae.dat $(DISTRINAME)/Makefile
	tar -czf $(DISTRINAME)-cripple.tar.gz $(DISTRINAME)

distri-linux:
	rm -f $(DISTRINAME)-linux.tar.bz2
	rm -Rf $(DISTRINAME)-linux
	make distri
	mv $(DISTRINAME) $(DISTRINAME)-linux
	make --directory=$(DISTRINAME)-linux DATADIR=\"\" all
	rm $(DISTRINAME)-linux/pp3.cc $(DISTRINAME)-linux/pp3.w
	tar -cf $(DISTRINAME)-linux.tar $(DISTRINAME)-linux
	bzip2 $(DISTRINAME)-linux.tar

distri-win:
	rm -f $(DISTRINAME)-win.zip
	rm -Rf $(DISTRINAME)-win
	make distri
	mv $(DISTRINAME) $(DISTRINAME)-win
	rm $(DISTRINAME)-win/pp3.cc $(DISTRINAME)-win/pp3.w
	cp win-bin/* $(DISTRINAME)-win
	zip -9 -r $(DISTRINAME)-win.zip $(DISTRINAME)-win/
