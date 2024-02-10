SHELL = bash
#include ../../shell_functions.make

docs =	macro2_notes

docs_output = $(addsuffix .pdf, $(docs))

all:	$(docs_output)

$(foreach doc, $(docs), $(doc).pdf): %.pdf: %.tex
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<
	rm $(basename $@).log $(basename $@).aux $(basename $@).toc $(basename $@).out || true

#include ../../generic.make