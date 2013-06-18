
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

%.cls %.tex %.md %.bib %.eps:unpack

class:itecreport-zh.cls itecreport-en.cls

doc:doc-zh doc-en
doc-zh:itecreport-zh-doc.pdf
doc-en:itecreport-en-doc.pdf

itecreport-%-doc.pdf:itecreport-%-doc.tex
	@$(TEX) $(*F)
	@$(INDEX) -s l3doc.ist $(*F)
	@$(TEX) $(*F)
	@$(TEX) $(*F)

example:example-zh example-en
example-zh:itecreport-zh-example.pdf
example-en:itecreport-zh-example.pdf

itecreport-%-example.pdf:itecreport-%-example.tex itecreport-ref-example.bib
	@$(TEX) $(*F)
	@$(BIBTEX) $(*F)
	@$(TEX) $(*F)
	@$(TEX) $(*F)


clean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo 

reallyclean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo \
			*.cls *.tex *.pdf *.md *.bib *.eps

.PHONY:all class doc doc-zh doc-en example example-zh example-en clean reallyclean
