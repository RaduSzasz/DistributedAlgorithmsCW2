.SUFFIXES: .erl .beam

MODULES = system client database replica server acceptor

ERLC = 	erlc -o ebin

ebin/%.beam: %.erl
	$(ERLC) $<

all:	ebin ${MODULES:%=ebin/%.beam}

ebin:
	mkdir ebin

L_ERL = erl -noshell -pa ebin psetcookie pass


SYSTEM = system
run: 	all
	$(L_ERL) -s $(SYSTEM) start
