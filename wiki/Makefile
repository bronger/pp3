CONSTELLATIONS = andromeda antlia apus aquarius aquila ara aries auriga bootes	\
caelum camelopardalis cancer canes_venatici canis_major canis_minor capricornus	\
carina cassiopeia centaurus cepheus cetus chamaeleon circinus columba		\
coma_berenices corona_australis corona_borealis corvus crater crux cygnus	\
delphinus dorado draco equuleus eridanus fornax gemini grus hercules horologium	\
hydra hydrus indus lacerta leo leo_minor lepus libra lupus lynx lyra mensa	\
microscopium monoceros musca norma octans ophiuchus orion pavo pegasus perseus	\
phoenix pictor pisces piscis_austrinus puppis pyxis reticulum sagitta		\
sagittarius scorpius sculptor scutum serpens sextans taurus telescopium		\
triangulum triangulum_australe tucana ursa_major ursa_minor vela virgo volans	\
vulpecula

%.eps : %.pp3 wiki.pp3 wiki.tex
	pp3 $<
	rm $(basename $@).dvi $(basename $@).log $(basename $@).tex

all: $(addsuffix _constellation_map.png,$(CONSTELLATIONS))

all-epses: $(addsuffix .eps,$(CONSTELLATIONS))

%_constellation_map.png : %.eps
	gimp --console-messages -i -d -b \
	  '(wiki-convert-sky-chart "$<" "$(basename $@)" 64 50)' '(gimp-quit 0)'

clean:
	rm $(addsuffix _constellation_map.png,$(CONSTELLATIONS)) \
	  $(addsuffix _constellation_map_small.png,$(CONSTELLATIONS))
