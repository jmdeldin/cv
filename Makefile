TEX	:= xelatex
SRC	:= jmdeldin_cv
OUT	:= $(SRC).pdf
BUILD   := build

all:
	mkdir -p $(BUILD)
	$(TEX) --output-directory=$(BUILD) $(SRC)

debug: all
	open $(BUILD)/$(OUT)

clean:
	rm -f $(BUILD)/*.{aux,log,out}

clobber: clean
	rm -rf $(BUILD)

