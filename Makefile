#	$Id$	
.PHONY: distri distri-cripple rpm distri-win all info doc

# you may set this to empty in order to install the files
# non-locally.
LOCAL=local

USRDIR=/usr/$(LOCAL)

# Standard share directory
DATADIR= $(USRDIR)/share

# directory for pp3 databases
PP3DATA= $(DATADIR)/pp3

# General documentation
DOCDIR= $(DATADIR)/doc/pp3

# Texinfo documentation
DOCDIR= $(DATADIR)/info

# destination directory for executables
DESTDIR= $(USRDIR)/bin

CHANGEFILE=-

CXXFLAGS=-s -O2

# The standard file permissions for installed 
# non-executables
PERMS= a+r,u+w

# No changes should be necessary below this line 
# -----------------------------------------------------

all: pp3

doc: pp3-source.pdf

%.cc : %.w
	$(CTANGLE) $* $(CHANGEFILE) $@

%.dvi : %.w
	$(CWEAVE) $*
	$(TEX) $*

pp3: pp3.cc
	$(CXX) -DPP3DATA=\"$(PP3DATA)\" pp3.cc $(CXXFLAGS) -o pp3

ephem: ephem.cc
	$(CXX) ephem.cc $(CXXFLAGS) -o ephem

pp3-source.pdf: pp3.w
	$(CWEAVE) pp3.w
	pdftex pp3.tex
	mv pp3.pdf $@

pp3-source.ps: pp3.dvi
	dvips pp3
	psselect -p_1,_,1-_2 pp3.ps pp3_.ps
	mv pp3_.ps $@

pp3-source.ps.gz: pp3.dvi
	make pp3.ps
	gzip -f pp3.ps
	mv pp3.ps.gz $@

info:
	$(MAKE) --directory=$@ ROOT=$(ROOT) PERMS=$(PERMS) INFODIR=$(INFODIR) \
	  DOCDIR=$(DOCDIR)

install: all
	install -d $(ROOT)$(DESTDIR)
	install -s pp3 $(ROOT)$(DESTDIR)
	install -d $(ROOT)$(PP3DATA)
	install --mode=$(PERMS) *.dat $(ROOT)$(PP3DATA)
	install -d $(ROOT)$(DATADIR)/doc/pp3
	install --mode=$(PERMS) pp3-source.ps $(ROOT)$(DATADIR)/doc/pp3
	install -d $(ROOT)$(DATADIR)/doc/pp3/examples
	install --mode=$(PERMS) examples/* $(ROOT)$(DATADIR)/doc/pp3/examples
	$(MAKE) --directory=info/ install ROOT=$(ROOT) PERMS=$(PERMS) \
	  INFODIR=$(INFODIR) DOCDIR=$(DOCDIR)

DISTRINAME= pp3-1.3.3
RPMNAME= $(DISTRINAME)-1tb.spec

distri:
	rm -f $(DISTRINAME).tar.bz2
	rm -Rf $(DISTRINAME)
	- rm pp3.cc
	mkdir $(DISTRINAME)
	make pp3.cc
	cp pp3.w pp3.cc $(DISTRINAME)
	cp COPYING README WHATSNEW Makefile $(DISTRINAME)
	cp stars.dat milkyway.dat nebulae.dat lines.dat boundaries.dat \
	  $(DISTRINAME)
	mkdir $(DISTRINAME)/examples
	cp wiki/*.pp3 wiki/wiki.tex wiki/Makefile wiki/wiki-convert-sky-chart.scm \
	  $(DISTRINAME)/examples
	cp -r info $(DISTRINAME)/
	-rm -Rf $(DISTRINAME)/info/CVS $(DISTRINAME)/info/*~
	tar -cjf $(DISTRINAME).tar.bz2 $(DISTRINAME)

distri-cripple:
	rm -f $(DISTRINAME)-cripple.tar.gz
	rm -Rf $(DISTRINAME)-cripple
	make distri
	rm $(DISTRINAME)/milkyway.dat $(DISTRINAME)/pp3.w \
	  $(DISTRINAME)/nebulae.dat $(DISTRINAME)/Makefile
	rm -Rf $(DISTRINAME)/info/
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
	mv $(DISTRINAME)/info/pp3 $(DISTRINAME)/manual
	rm -Rf $(DISTRINAME)/info/
	cp win-bin/* $(DISTRINAME)-win
	zip -9 -r $(DISTRINAME)-win.zip $(DISTRINAME)-win/

