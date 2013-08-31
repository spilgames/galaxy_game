
.PHONY: clean test doc

all: compile

compile:
	./rebar compile xref

clean:
	./rebar clean

test:
	./rebar eunit

docs: docsclean
	./rebar doc

docsclean:
	rm -f doc/*.html doc/*.css doc/*.png doc/edoc-info
