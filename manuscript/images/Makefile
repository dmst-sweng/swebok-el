.SUFFIXES:.png .txt

S=png

DIAGRAMS=1-SoftReq.$S 3-SoftDesign.$S 4-SoftConstr.$S 5-SoftTest.$S \
7-SoftMainten.$S 8-SoftConfigMng.$S 9-SoftEngMng.$S 10-SoftEngProc.$S \
11-SoftEngMM.$S 12-SoftQual.$S 14-SoftEngProfPr.$S 15-SoftEngEcon.$S

%.png: %.txt
	./txt2png.sh $< $@

all: $(DIAGRAMS)

clean:
	rm -f $(DIAGRAMS)
