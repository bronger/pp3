#	$Id$	
.PHONY: distri distri-cripple rpm distri-win all doc

# you may set this to empty in order to install the files
# non-locally.
LOCAL=local

USRDIR=/usr/$(LOCAL)

# directory for pp3 databases
PP3DATA= $(USRDIR)/share/pp3

# directory for pp3 documentation and examples
DOCDIR= $(USRDIR)/share/doc/pp3

# destination directory for executables
DESTDIR= $(USRDIR)/bin

CHANGEFILE=-

CXXFLAGS=-s -O2

all: pp3

doc: pp3.pdf

%.cc : %.w
	$(CTANGLE) $* $(CHANGEFILE) $@

%.dvi : %.w
	$(CWEAVE) $*
	$(TEX) $*

pp3: pp3.cc
	$(CXX) -DPP3DATA=\"$(PP3DATA)\" pp3.cc $(CXXFLAGS) -o pp3

ephem: ephem.cc
	$(CXX) ephem.cc $(CXXFLAGS) -o ephem

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

install: all
	install -d $(ROOT)$(DESTDIR)
	install -s pp3 $(ROOT)$(DESTDIR)
	install -d $(ROOT)$(PP3DATA)
	cp -p *.dat $(ROOT)$(PP3DATA)
	install -d $(ROOT)$(DOCDIR)
	cp -p pp3.ps $(ROOT)$(DOCDIR)
	install -d $(ROOT)$(DOCDIR)/examples
	cp -p examples/* $(ROOT)$(DOCDIR)/examples

DISTRINAME= pp3-1.3.1
RPMNAME= $(DISTRINAME)-1tb.spec

distri:
	rm -f $(DISTRINAME).tar.bz2
	rm -Rf $(DISTRINAME)
	- rm pp3.cc
	mkdir $(DISTRINAME)
	make pp3.cc
	make pp3.ps
	cp pp3.w pp3.cc pp3.ps $(DISTRINAME)
	cp COPYING README WHATSNEW Makefile $(DISTRINAME)
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

rpm:
	rm -f pp3.cc
	make distri CXXFLAGS="$(CXXFLAGS)"
	cp $(DISTRINAME).tar.bz2 $(HOME)/packages/pp3/
	rpm -ba $(RPMNAME)

distri-win:
	rm -f $(DISTRINAME)-win.zip
	rm -Rf $(DISTRINAME)-win
	make distri
	mv $(DISTRINAME) $(DISTRINAME)-win
	rm $(DISTRINAME)-win/pp3.cc $(DISTRINAME)-win/pp3.w
	cp win-bin/* $(DISTRINAME)-win
	zip -9 -r $(DISTRINAME)-win.zip $(DISTRINAME)-win/

