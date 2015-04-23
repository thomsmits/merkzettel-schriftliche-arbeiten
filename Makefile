# Makefile for the TPE exam

OUTPUT_DIR = 00_Output
DEPLOY_DIR = /Users/thomas/Documents/Work/Webseite/web/files
LATEX = pdflatex
BIBTEX = bibtex
MAKEINDEX = makeindex

define latex-it
$(eval FILE = $(firstword $^))
@echo "Building $(FILE)"
@echo $(FILE)
@$(LATEX) -output-directory=$(OUTPUT_DIR) $(FILE)    > /dev/null  
@$(BIBTEX) $(OUTPUT_DIR)/$(basename $(FILE)).aux     > /dev/null
# @$(MAKEINDEX) $(OUTPUT_DIR)/$(basename $(FILE)).idx  > /dev/null
@$(LATEX) -output-directory=$(OUTPUT_DIR) $(FILE)    > /dev/null
@$(LATEX) -output-directory=$(OUTPUT_DIR) $(FILE)    > /dev/null
endef


all: $(OUTPUT_DIR) \
		$(DEPLOY_DIR)/Merkzettel_fuer_schriftliche_Arbeiten.pdf 

clean:
	rm -rf $(OUTPUT_DIR)

$(OUTPUT_DIR)/Merkzettel_fuer_schriftliche_Arbeiten.pdf: Merkzettel_fuer_schriftliche_Arbeiten.tex
	$(latex-it)

$(DEPLOY_DIR)/Merkzettel_fuer_schriftliche_Arbeiten.pdf: $(OUTPUT_DIR)/Merkzettel_fuer_schriftliche_Arbeiten.pdf
	@cat $< > $@
 
$(OUTPUT_DIR):
	mkdir $(OUTPUT_DIR)

.PHONY: clean all
