.SUFFIXES:.png .txt

S=png

DIAGRAMS=1-SoftReq.$S 2-SoftDesign.$S 3-SoftConstr.$S 4-SoftTest.$S \
5-SoftMainten.$S 6-SoftConfigMng.$S 7-SoftEngMng.$S 8-SoftEngProc.$S \
9-SoftEngMM.$S 10-SoftQual.$S 11-SoftEngProfPr.$S 12-SoftEngEcon.$S

%.png: %.txt
	recode cp-1253/..UTF-8 <$< | ./tab2dot.pl | dot -T$S -o$@

all: $(DIAGRAMS)
