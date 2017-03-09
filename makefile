.DEFAULT_GOAL := all

PRODUCTS = \
	product \
	product/thesis.pdf


#####################
# Downloaded data
#####################

product/thesis.md: ./data/thesis.yaml templates/thesis.md product
	cat $< | ./node_modules/.bin/yaml2resume -t ./templates/thesis.md | pandoc -t markdown > $@
	cat $@

product/thesis.pdf: ./product/thesis.md templates/default.latex ./makefile
	pandoc \
		--template=./templates/default.latex \
		-V mainfont:"Fira Sans Light" \
		-V colorlinks:true \
		-V papersize:a4 \
		-V geometry:margin=1.5cm \
		--latex-engine=xelatex $< -o $@


product:
	mkdir -p product

all: product $(PRODUCTS)

clean:
	rm -rf $(PRODUCTS) product 
