# Wrappers to make it possible to use python style config files in bash, R
# Dr Owain Kenway

# Where it is distributed, it is done so under the MIT license.

installdir = $(HOME)/bin

install: 
	cp pyconfconv.py $(installdir)/pyconfconv.py
	ln -fs $(installdir)/pyconfconv.py $(installdir)/pyconfconv
	cp pyconfconv.sh $(installdir)/pyconfconv.sh
	cp pyconfconv.r $(installdir)/pyconfconv.r

