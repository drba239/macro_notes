SHELL = bash
include ../../../../shell_functions.make

# Define function to get input files from a tex file
define get_tex_inputs
$(shell grep --no-filename '\\input' $(1).tex | grep -v '^%' | grep -o 'input{[A-Za-z0-9_\/\.]*}' | sed 's/input{//' | sed 's/}$$//')
endef

psets =	pset_2023_24_ps1_golosov pset_2023_24_ps2_golosov pset_2023_24_ps3_golosov


# Initialize pset_input as empty
pset_input :=

# For each pset exam, get the input files, make a variable containing the input file names for just that pset, and then add them to the full
# list of input files for all psets
$(foreach pset,$(psets),\
$(eval $(pset)_input := $(call get_tex_inputs,$(pset)))\
$(eval pset_input += $$($(pset)_input)))

# Add .pdf to the end of each pset exam to get the output file names
output_psets = $(addsuffix .pdf, $(psets))

all:	$(output_psets)

define latex_compile_rule
$(pset).pdf: $(pset).tex $($(pset)_input)
	pdflatex -shell-escape $$<
	pdflatex -shell-escape $$<
	pdflatex -shell-escape $$<
	rm $(basename $(pset)).log $(basename $(pset)).aux $(basename $(pset)).toc $(basename $(pset)).out || true
endef

$(foreach pset, $(psets), \
	$(eval $(latex_compile_rule)) \
)

$(pset_input): ../input/%: ../../questions/% | ../input
	ln -sf $< $@

include ../../../../generic.make