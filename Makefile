LATEXMK=latexmk
TEXFLAGS=-shell-escape

SRC=src.tex
OUT=$(SRC:.tex=.pdf)
JOBNAME=$(patsubst %.pdf,%,$(OUT))

BUILDFILES=_minted-$(JOBNAME) $(JOBNAME).run.xml $(JOBNAME).bbl #$(wildcard *.fls)


all: $(OUT)


clean:
	@echo "Cleaning"
	@$(LATEXMK) $(TEXFLAGS) -C -pdf $(SRC)
	@rm -rf $(BUILDFILES)


preview:
	@$(LATEXMK) $(TEXFLAGS) -pdf -pvc $(SRC)


$(OUT): $(SRC)
	@$(LATEXMK) $(TEXFLAGS) -pdf $^
	@$(LATEXMK) $(TEXFLAGS) -c $^
	@rm -rf $(BUILDFILES)


.PHONY: all clean
