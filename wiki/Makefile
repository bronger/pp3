CONSTELLATIONS = leo

%.eps : %.pp3 wiki.pp3
	pp3 $<

all: $(addsuffix _constellation_map.png,$(CONSTELLATIONS))

leo_constellation_map.png : leo.eps
	gimp --console-messages -i -d -b \
	  '(wiki-convert-sky-chart "$<" "$(basename $@)" 64)' '(gimp-quit 0)'
