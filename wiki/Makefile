CONSTELLATIONS = andromeda bootes carina crux libra orion taurus aquarius	\
cancer cassiopeia cygnus monoceros perseus ursa_major aquila canes_venatici	\
centaurus delphinus pisces ursa_minor ara canis_major cetus eridanus norma	\
sagittarius virgo aries canis_minor coma_berenices gemini octans scorpius	\
vulpecula auriga capricornus corvus leo ophiuchus serpens hercules hydra	\
camelopardalis cepheus pegasus draco

%.eps : %.pp3 wiki.pp3 wiki.tex
	pp3 $<
	rm $(basename $@).dvi $(basename $@).log $(basename $@).tex

all: $(addsuffix _constellation_map.png,$(CONSTELLATIONS))

%_constellation_map.png : %.eps
	pp3 $(basename $<).pp3
	rm $(basename $<).dvi $(basename $<).log $(basename $<).tex
	gimp --console-messages -i -d -b \
	  '(wiki-convert-sky-chart "$<" "$(basename $@)" 64)' '(gimp-quit 0)'

clean:
	rm $(addsuffix _constellation_map.png,$(CONSTELLATIONS)) \
	  $(addsuffix _constellation_map_small.png,$(CONSTELLATIONS)) \
	  $(addsuffix .eps,$(CONSTELLATIONS))
