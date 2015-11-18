CSCOPTS= 

SRCFILES = configf.scm common.o

OFILES   = $(SRCFILES:%.scm=%.o)

#csc -deploy $(CSCOPTS) $(OFILES) megatest.scm -o deploytarg

test-configf: run_configf.o $(OFILES)
	csc $(CSCOPTS) $(OFILES) run_configf.o -o run_configf
	./run_configf

%.o : %.scm
	csc $(CSCOPTS) -c $<

