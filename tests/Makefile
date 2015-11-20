CSCOPTS= 

SRCFILES = run.scm

OFILES   = $(SRCFILES:%.scm=%.o)

#csc -deploy $(CSCOPTS) $(OFILES) megatest.scm -o deploytarg

help: 
	@echo "Makefile targets"
	@echo "================"
	@echo "make test - run tests"
	@echo "make clean - clean up .o's and binaries"

test: $(OFILES)
	csc $(CSCOPTS) $(OFILES) -o run_ini-file-test
	./run_ini-file-test

%.o : %.scm
	csc $(CSCOPTS) -c $<

clean:
	rm -f *.o run_ini-file-test
