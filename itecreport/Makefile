
# OS detected
ifeq ($(OS),Windows_NT)
	ifneq ($(findstring .exe,$(SHELL)),)
    OS_TYPE := Windows
	else
    OS_TYPE := Cygwin
	endif
else
    OS_TYPE := $(shell uname -s)
endif

# Program Defintions
TEX    = lualatex -shell-escape -8bit 
BIBTEX = bibtex
INDEX  = makeindex -q 
RM     = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -f )

all:class doc example

unpack:itecreport.dtx itecreport.ins
	@$(TEX) itecreport.ins

%.cls %.tex %.md %.bib:itecreport.dtx itecreport.ins
	@$(TEX) itecreport.ins

class:itecreport-zh.cls itecreport-en.cls

doc:itecreport.pdf

itecreport.pdf:itecreport.dtx
	@$(TEX) $(^F)
	@$(INDEX) -s l3doc.ist $(basename $(^F))
	@$(TEX) $(^F)
	@$(TEX) $(^F)

example:example-zh example-en
example-zh:itecreport-zh-example.pdf
example-en:itecreport-en-example.pdf

itecreport-zh-example.pdf itecreport-en-example.pdf:%-example.pdf:%-example.tex %.cls ref-example.bib
	@$(TEX) $(<F)
	@$(BIBTEX) $(basename $(<F))
	@$(TEX) $(<F)
	@$(TEX) $(<F)

clean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.hd *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo \
			*.cls *.tex *.md *.bib

reallyclean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.hd *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo \
			*.cls *.tex *.md *.bib itecreport*.pdf

checksum:FORCE
	perl adjust_checksum.pl itecreport.dtx

FORCE:
.PHONY:all unpack class doc example example-zh example-en clean reallyclean checksum FORCE
