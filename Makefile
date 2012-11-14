stylus_nm := "node_modules/stylus/bin/stylus"
stylus := $(shell test -f ${stylus_nm} && echo ${stylus_nm} || echo stylus) 

.SILENT: ;      # no need for @
.EXPORT_ALL_VARIABLES: ; # send all vars to shell
Makefile: ;     # skip prerequisite discovery

default : test

.PHONY: test
test:
	npm test

public/stylesheets:
	# Lets see if stylus is working first or abort
	$$stylus --version &> /dev/null  || (echo "Cannot find stylus did you run make install?" && false); 
	mkdir -p public/stylesheets/themes
	$$stylus app/stylesheets/screen.styl -o public/stylesheets --use nib
	$$stylus app/stylesheets/themes -o public/stylesheets/themes --use nib
	$$stylus app/stylesheets/site.styl -o public/stylesheets --use nib

install:
	npm install

