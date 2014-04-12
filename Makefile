.SUFFIXES:.pdf .tab

DIAGRAMS=4-testing.pdf

%.pdf: %.tab
	./tab2dot.pl $< | dot -Tpdf -o$@

all: $(DIAGRAMS)

