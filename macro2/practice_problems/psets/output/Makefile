SHELL = bash
include ../../../../shell_functions.make

pset_2023_24_ps1_golosov_input := $(shell grep --no-filename '\\input' ../tex_files/pset_2023_24_ps1_golosov.tex | grep -v '^%' | grep -o 'input{[A-Za-z0-9_\/\.]*}'  | sed 's/input{//' | sed 's/}$$//')
pset_2023_24_ps2_golosov_input := $(shell grep --no-filename '\\input' ../tex_files/pset_2023_24_ps2_golosov.tex | grep -v '^%' | grep -o 'input{[A-Za-z0-9_\/\.]*}'  | sed 's/input{//' | sed 's/}$$//')

pset_input = $(pset_2023_24_ps1_golosov_input) $(pset_2023_24_ps2_golosov_input)

psets =	pset_2023_24_ps1_golosov pset_2023_24_ps2_golosov
psets_all = $(addsuffix .pdf, $(psets))

all:	$(psets_all)

define latex_compile_rule
$(pset).pdf: ../tex_files/$(pset).tex $($(pset)_input)
	pdflatex -shell-escape $$<
	pdflatex -shell-escape $$<
	pdflatex -shell-escape $$<
	rm $(basename $(pset)).log $(basename $(pset)).aux $(basename $(pset)).toc $(basename $(pset)).out || true
endef

$(foreach pset, $(psets), \
	$(eval $(latex_compile_rule)) \
)

$(pset_input): ../input/%: ../../questions/% | ../input/
	ln -sf $< $@

#include ../../../../generic.make