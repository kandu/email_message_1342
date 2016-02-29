PROJECT= email_message_1342

lib: $(PROJECT).cma $(PROJECT).cmxa

$(PROJECT).cma: $(PROJECT).ml
	ocamlfind ocamlc -thread -package email_message -a -o $@ $^

$(PROJECT).cmxa: $(PROJECT).ml
	ocamlfind ocamlopt -thread -package email_message -a -o $@ $^

$(PROJECT).ml: $(PROJECT).cmi


$(PROJECT).cmi: $(PROJECT).mli
	ocamlfind ocamlc -thread -package email_message $<

.PHONY: install clean

install: lib
	ocamlfind install $(PROJECT) META *.mli *.cmi *.cma *.cmxa *.a

uninstall:
	ocamlfind remove $(PROJECT)

clean:
	rm -f *.annot *.o *.cm* *.a *.so

