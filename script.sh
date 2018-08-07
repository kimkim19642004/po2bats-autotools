#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
linux )
	# Note:
	# Since the versions of 'automake' and 'gettext' are old,
	# reconfigure this build system before execute the command './ configure && make'.
	sudo apt install autopoint expect
	./gettextize.exp
	autoreconf -f -i

	# Note: Generate source code with 100% code coverage.
	./configure --enable-testcode && make
	make check
	cat ./tests/testsuite.log
	make distcheck
	cat ./tests/testsuite.log
	sudo make install
	make installcheck
	cat ./tests/testsuite.log ;;
osx )
	export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
	export MANPATH=$(brew --prefix coreutils)/libexec/gnubin:$MANPATH

	# Note: Generate source code with 100% code coverage.
	./configure --enable-testcode && make
	make check
	cat ./tests/testsuite.log
	make distcheck
	cat ./tests/testsuite.log
	sudo make install
	make installcheck
	cat ./tests/testsuite.log ;;
* )
	printf '\033[0;31mUnknown value: TRAVIS_OS_NAME=%s\033[0m\n' $TRAVIS_OS_NAME >&2 &&
	exit 1 ;;
esac
