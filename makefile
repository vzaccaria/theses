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
		-V fontsize:10pt \
		-V colorlinks:true \
		-V papersize:a4 \
		-V geometry:margin=1.5cm \
		-V linestretch:0.95 \
		--latex-engine=xelatex $< -o $@


product:
	mkdir -p product

all: product $(PRODUCTS)

clean:
	rm -rf $(PRODUCTS) product 
