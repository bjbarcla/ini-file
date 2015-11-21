CSCOPTS= 

SRCFILES = run.scm

OFILES   = $(SRCFILES:%.scm=%.o)

#csc -deploy $(CSCOPTS) $(OFILES) megatest.scm -o deploytarg

help: 
	@echo "Makefile targets"
	@echo "================"
	@echo "make test - run tests"
	@echo "make clean - clean up .o's and binaries"

ini-file.import.c: ini-file.scm
	chicken-install -no-install

test: $(OFILES) ini-file.import.c
	csc $(CSCOPTS) $(OFILES) -o run_ini-file-test
	./run_ini-file-test

run2: run2.scm ini-file.import.c
	csc $(CSCOPTS) run2.scm -o run2
	./run2

%.o : %.scm
	csc $(CSCOPTS) -c $<

clean:
	rm -f *.o run_ini-file-test ini-file.import.* ini-file.c ini-file.so run2
