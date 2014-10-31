# Path to pari.cfg file:
PARI_CFG=$(HOME)/local/lib/pari/pari.cfg
# Path to 'emacs' binary
EMACS=emacs

all: pari-conf.el elc

pari-conf.el: pari-conf.el.in
	. $(PARI_CFG); sed -e "s/@version@/$$pari_release/" \
	    -e "s!@emacsdir@!$(shell pwd)!" \
	    -e "s!@bindir@!$$bindir!" pari-conf.el.in > $@

elc:
	@echo "Byte-Compiling elisp files..."
	-$(EMACS) -batch \
	   --eval '(setq load-path (append (list ".") load-path))' \
	   -f batch-byte-compile *.el

clean:
	rm -f *.elc pari-conf.el
