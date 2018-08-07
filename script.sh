#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
'linux' )
	if [ "$REBUILD_INSTALLER" = 'on' ]; then
		./gettextize.exp
		autoreconf -f -i
	else
		## Note: The following is required only after the initial 'git clone'.
		## Match the time-stamp of the following files with the rules described in 'Makefile'.
		touch aclocal.m4
		touch configure
		touch Makefile.am
		touch src/Makefile.am
		touch Makefile.in
		touch src/Makefile.in
	fi
	# Note: Generate source code with 100% code coverage.
	./configure --enable-code-coverage --enable-testcode && make
	make check; _ret=$?; cat ./tests/testsuite.log; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	## Note: Test results are output according to the rules of 'make distcheck'.
	make distcheck; _ret=$?; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	sudo make install
	make installcheck; _ret=$?; cat ./tests/testsuite.log; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	sudo make uninstall;_ret=$?; cat ./config.log; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	make clean; _ret=$?; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	make distclean; _ret=$?; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	;;
'osx' )
	PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
	PATH=$(brew --prefix gettext)/bin:$PATH
	PATH=$(brew --prefix gnu-getopt)/bin:$PATH
	export PATH

	if [ "$REBUILD_INSTALLER" = 'on' ]; then
		./gettextize.exp
		autoreconf -f -i
	else
		## Note: The following is required only after the initial 'git clone'.
		## Match the time-stamp of the following files with the rules described in 'Makefile'.
		touch aclocal.m4
		touch configure
		touch Makefile.am
		touch src/Makefile.am
		touch Makefile.in
		touch src/Makefile.in
	fi
	# Note: Generate source code with 100% code coverage.
	./configure --enable-code-coverage --enable-testcode && make
	make check; _ret=$?; cat ./tests/testsuite.log; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	## Note: Test results are output according to the rules of 'make distcheck'.
	make distcheck; _ret=$?; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	make install
	make installcheck; _ret=$?; cat ./tests/testsuite.log; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	make uninstall;_ret=$?; cat ./config.log; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	make clean; _ret=$?; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	make distclean; _ret=$?; if [ "${_ret}" -ne 0 ]; then exit 1; fi
	;;
* )
	printf '\033[0;31mUnknown value: TRAVIS_OS_NAME=%s\033[0m\n' $TRAVIS_OS_NAME >&2 &&
	exit 1 ;;
esac
