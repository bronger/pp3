CONSTELLATIONS = andromeda antlia apus aquarius aquila ara aries auriga bootes	\
caelum camelopardalis cancer canes_venatici canis_major canis_minor capricornus	\
carina cassiopeia centaurus cepheus cetus coma_berenices corvus crux cygnus	\
delphinus draco equuleus eridanus fornax gemini grus hercules hydra indus	\
lacerta leo leo_minor libra lupus lynx lyra microscopium monoceros norma octans	\
ophiuchus orion pavo pegasus perseus phoenix pictor pisces piscis_austrinus	\
puppis sagittarius scorpius sculptor scutum serpens taurus triangulum tucana	\
ursa_major ursa_minor vela virgo vulpecula sextans sagitta corona_borealis	\
crater lepus columba

%.eps : %.pp3 wiki.pp3 wiki.tex
	pp3 $<
	rm $(basename $@).dvi $(basename $@).log $(basename $@).tex

all: $(addsuffix _constellation_map.png,$(CONSTELLATIONS))

%_constellation_map.png : %.eps
	gimp --console-messages -i -d -b \
	  '(wiki-convert-sky-chart "$<" "$(basename $@)" 64)' '(gimp-quit 0)'

clean:
	rm $(addsuffix _constellation_map.png,$(CONSTELLATIONS)) \
	  $(addsuffix _constellation_map_small.png,$(CONSTELLATIONS))
