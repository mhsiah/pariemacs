#===========================================================================
# You may need to modify one of the following variables

# Path to pari.cfg file:
PARI_CFG=$(HOME)/local/lib/pari/pari.cfg

# Path to 'emacs' binary
EMACS=emacs

#===========================================================================
# Maintainer only.

FILES=Makefile pari-completion.el pari-conf.el.in pari-fontification.el pari-help.el pari-messages.el pari.el pari-history.el README CHANGES COPYING sli-tools.el

install: pari-conf.el elc
	mkdir -p $(INSTALL)
	cp *.elc *.el README CHANGES COPYING $(INSTALL)

pari-conf.el: pari-conf.el.in
	. $(PARI_CFG); sed -e "s/@version@/$$pari_release/" \
	    -e "s!@emacsdir@!$(INSTALL)!" \
	    -e "s!@bindir@!$$bindir!" pari-conf.el.in > $@

elc:
	@echo "Byte-Compiling elisp files..."
	-$(EMACS) -batch \
	   --eval '(setq load-path (append (list ".") load-path))' \
	   -f batch-byte-compile *.el

clean:
	rm -f *.elc pari-conf.el
