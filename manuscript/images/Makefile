.SUFFIXES:.png .txt

S=png

TXT_FILES := $(wildcard *.txt)
DIAGRAMS := $(patsubst %.txt,%.$S,$(TXT_FILES))

%.png: %.txt
	./txt2png.sh $< $@

all: $(DIAGRAMS)

clean:
	rm -f $(DIAGRAMS)
