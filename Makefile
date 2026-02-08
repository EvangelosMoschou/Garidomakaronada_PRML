#======================================================================
# GARIDOMAKARONADA MAKEFILE
#======================================================================
# Usage:
#   make read           - Build colored PDF for reading (LuaLaTeX)
#   make print          - Build B&W PDF for printing (LuaLaTeX)
#   make hand           - Build handwriting-style PDF (LuaLaTeX) [NOT SUPPORTED WITHOUT HAND TEMPLATE]
#   make all            - Build read and print versions
#   make clean          - Remove all build artifacts
#
# MODES:
#   READ  - Colorful boxes, great for screen viewing
#   PRINT - White backgrounds, saves ink
#======================================================================

FILE = Garidomakaronada_PRML
LUALATEX = lualatex
FLAGS = -interaction=nonstopmode

.PHONY: all read print clean

all: read print

#----------------------------------------------------------------------
#   READ MODE (LuaLaTeX - Color)
#----------------------------------------------------------------------
read: $(FILE).tex
	@echo "╔═══════════════════════════════════════════════════════════════╗"
	@echo "║  Building READ mode (Color)                                   ║"
	@echo "╚═══════════════════════════════════════════════════════════════╝"
	$(LUALATEX) $(FLAGS) --jobname=Garidomakaronada_PRML_Read $(FILE).tex
	$(LUALATEX) $(FLAGS) --jobname=Garidomakaronada_PRML_Read $(FILE).tex
	@echo "Cleaning up auxiliary files..."
	@rm -f Garidomakaronada_PRML_Read.aux Garidomakaronada_PRML_Read.log Garidomakaronada_PRML_Read.out Garidomakaronada_PRML_Read.toc 2>/dev/null || true
	@echo "✓ Output: Garidomakaronada_PRML_Read.pdf"
	@echo ""

#----------------------------------------------------------------------
#   PRINT MODE (LuaLaTeX - B&W)
#----------------------------------------------------------------------
print: $(FILE).tex
	@echo "╔═══════════════════════════════════════════════════════════════╗"
	@echo "║  Building PRINT mode (B&W)                                    ║"
	@echo "╚═══════════════════════════════════════════════════════════════╝"
	$(LUALATEX) $(FLAGS) --jobname=Garidomakaronada_PRML_Print "\def\printmodeflag{}\input{$(FILE).tex}"
	$(LUALATEX) $(FLAGS) --jobname=Garidomakaronada_PRML_Print "\def\printmodeflag{}\input{$(FILE).tex}"
	@echo "Cleaning up auxiliary files..."
	@rm -f Garidomakaronada_PRML_Print.aux Garidomakaronada_PRML_Print.log Garidomakaronada_PRML_Print.out Garidomakaronada_PRML_Print.toc 2>/dev/null || true
	@echo "✓ Output: Garidomakaronada_PRML_Print.pdf"
	@echo ""

#----------------------------------------------------------------------
#   CLEAN
#----------------------------------------------------------------------
clean:
	@echo "Cleaning up all build artifacts..."
	rm -f *.aux *.log *.out *.toc *.pdf *.synctex.gz 2>/dev/null || true
	@echo "✓ Clean complete"
