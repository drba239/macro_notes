SHELL = bash
include ../../../../shell_functions.make

psets =	pset_2023_24_ps1_golosov

psets_output = $(addsuffix .pdf, $(psets))

all:	$(psets_output)

$(foreach pset, $(psets), $(pset).pdf): %.pdf: ../tex_files/%.tex
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<
	rm $(basename $@).log $(basename $@).aux $(basename $@).toc $(basename $@).out || true

#include ../../../../generic.make