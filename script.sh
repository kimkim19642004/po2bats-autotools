#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
linux )
	if [ "$REBUILD_INSTALLER" = 'on' ]; then
		# Note: if you want to rebuild the installer:
		sudo apt install autopoint expect
		./gettextize.exp
		sudo apt install autoconf-archive
		autoreconf -f -i
	else
		## Note: The following is required only after the initial 'git clone'.
		## Match the time-stamp of the following files with the rules described in 'Makefile'.
		touch aclocal.m4 Makefile.in
	fi
	# Note: Generate source code with 100% code coverage.
	./configure --enable-testcode && make
	make check; cat ./tests/testsuite.log
	## Note: Test results are output according to the rules of 'make distcheck'.
	make distcheck
	sudo make install
	make installcheck; cat ./tests/testsuite.log ;;
osx )
	MANPATH=$(brew --prefix coreutils)/libexec/gnubin:$MANPATH
	PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
	PATH=$(brew --prefix gettext)/bin:$PATH
	PATH=$(brew --prefix gnu-getopt)/bin:$PATH
	export PATH MANPATH

	if [ "$REBUILD_INSTALLER" = 'on' ]; then
		# Note: Uncomment if you want to rebuild the installer:
		brew install expect
		./gettextize.exp
		brew install autoconf-archive
		autoreconf -f -i
	else
		## Note: The following is required only after the initial 'git clone'.
		## Match the time-stamp of the following files with the rules described in 'Makefile'.
		touch aclocal.m4 Makefile.in
	fi
	# Note: Generate source code with 100% code coverage.
	./configure --enable-testcode && make
	make check; cat ./tests/testsuite.log
	## Note: Test results are output according to the rules of 'make distcheck'.
	make distcheck
	sudo make install
	make installcheck; cat ./tests/testsuite.log ;;
* )
	printf '\033[0;31mUnknown value: TRAVIS_OS_NAME=%s\033[0m\n' $TRAVIS_OS_NAME >&2 &&
	exit 1 ;;
esac
