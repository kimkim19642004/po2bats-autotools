#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
'linux' )
	if [ "$REBUILD_INSTALLER" = 'on' ]; then
		./gettextize.exp || exit 1
		autoreconf -f -i || exit 1
	else
		## The following is required only after the initial 'git clone'.
		## Match the timestamps of the following files with the rules described in 'Makefile'.
		touch aclocal.m4
		touch configure
		touch Makefile.am
		touch src/Makefile.am
		touch Makefile.in
		touch src/Makefile.in
	fi

	## Generate source code with 100% code coverage.
	case "$CC" in
	'gcc' )
		./configure --enable-code-coverage --enable-testcode || exit 1
		;;
	'clang' )
		## If the clang's path is not included in the root user's PATH:
		./configure --enable-code-coverage --enable-testcode --with-gcov='llvm-cov gcov' PATH="$(which $CC):$PATH" || exit 1
		;;
	* )
		echo "The value of 'CC' is invalid: $CC"; exit 1 ;;
	esac

	make
	make check; _ret=$?; cat ./config.log ./tests/testsuite.log; if ((_ret!=0)) ; then exit 1; fi
	## Test results are output according to the rules of 'make distcheck'.
	make distcheck || exit 1
	sudo make install || exit 1
	make installcheck; _ret=$?; cat ./tests/testsuite.log; if ((_ret!=0)) ; then exit 1; fi

	if ((${#TRAVIS_JOB_ID}>0)) ; then
		echo 'Sending coverage reports...'
		kcov --coveralls-id="$TRAVIS_JOB_ID" --bash-parser="$(which bash)" --bash-dont-parse-binary-dir --include-pattern='po2bats.sh' --exclude-pattern='po2bats.sh.in' ./tests/coverage po2bats.sh
		bash <(curl -s https://codecov.io/bash) -s ./tests/coverage
	fi

	sudo make uninstall; _ret=$?; cat ./config.log; if ((_ret!=0)) ; then exit 1; fi
	make clean || exit 1
	make distclean || exit 1
	;;
'osx' )
	## Set environment variables.
	## Note: Add the path for "llvm-cov" to the end.
	## See: [Xcode Build Settings Reference](https://pewpewthespells.com/blog/buildsettings.html)
	_s=$(clang --version | grep 'InstalledDir: ')
	DT_TOOLCHAIN_DIR=${_s#InstalledDir: }
	PATH=$PATH:$DT_TOOLCHAIN_DIR
	PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
	PATH=$(brew --prefix gettext)/bin:$PATH
	PATH=$(brew --prefix gnu-getopt)/bin:$PATH
	export PATH

	if [ "$REBUILD_INSTALLER" = 'on' ]; then
		./gettextize.exp
		autoreconf -f -i
	else
		## The following is required only after the initial 'git clone'.
		## Match the timestamps of the following files with the rules described in 'Makefile'.
		touch aclocal.m4
		touch configure
		touch Makefile.am
		touch src/Makefile.am
		touch Makefile.in
		touch src/Makefile.in
	fi

	## Generate source code with 100% code coverage.
	case "$CC" in
	'gcc' )
		./configure --enable-code-coverage --enable-testcode || exit 1
		;;
	'clang' )
		./configure --enable-code-coverage --enable-testcode --with-gcov='llvm-cov gcov' || exit 1
		;;
	* )
		echo "The value of 'CC' is invalid: $CC"; exit 1 ;;
	esac

	make
	make check; _ret=$?; cat ./config.log ./tests/testsuite.log; if ((_ret!=0)) ; then exit 1; fi
	## Test results are output according to the rules of 'make distcheck'.
	make distcheck || exit 1
	make install || exit 1
	make installcheck; _ret=$?; cat ./tests/testsuite.log; if ((_ret!=0)) ; then exit 1; fi

	if ((${#TRAVIS_JOB_ID}>0)) ; then
		echo 'Sending coverage reports...'
		kcov --coveralls-id="$TRAVIS_JOB_ID" --bash-parser="$(which bash)" --bash-dont-parse-binary-dir --include-pattern='po2bats.sh' --exclude-pattern='po2bats.sh.in' ./tests/coverage po2bats.sh
		bash <(curl -s https://codecov.io/bash) -s ./tests/coverage
	fi

	make uninstall; _ret=$?; cat ./config.log; if ((_ret!=0)) ; then exit 1; fi
	make clean || exit 1
	make distclean || exit 1
	;;
'BSD' )
	## Set environment variables.
	BATS_ROOT="/usr/local"
	PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
	PATH="$BATS_ROOT/libexec/bats-core:$PATH"
	export BATS_ROOT
	export PATH

	# Root User?
	./is_root_user.sh
	_is_root_user=$?
	
	if [ "$REBUILD_INSTALLER" = 'on' ]; then
		./gettextize.exp
		autoreconf -f -i
	else
		## The following is required only after the initial 'git clone'.
		## Match the timestamps of the following files with the rules described in 'Makefile'.
		touch aclocal.m4
		touch configure
		touch Makefile.am
		touch src/Makefile.am
		touch Makefile.in
		touch src/Makefile.in
	fi

	## Generate source code with 100% code coverage.
	case "$CC" in
	'gcc' )
		if ((_is_root_user!=0)) ; then
			./configure --enable-code-coverage --enable-testcode || exit 1
		else
			# root users is not recommended.
			./configure --enable-testcode || exit 1
		fi
		;;
	'clang' )
		if ((_is_root_user!=0)) ; then
			./configure --enable-code-coverage --enable-testcode --with-gcov='llvm-cov gcov' || exit 1
		else
			# root users is not recommended.
			./configure --enable-testcode --with-gcov='llvm-cov gcov' || exit 1
		fi
		;;
	* )
		echo "The value of 'CC' is invalid: $CC"; exit 1 ;;
	esac

	## Note: Always use 'gmake' on FreeBSD!
	gmake
	gmake check; _ret=$?; cat ./config.log ./tests/testsuite.log; if ((_ret!=0)) ; then exit 1; fi
	## Test results are output according to the rules of 'make distcheck'.
	gmake distcheck || exit 1
	sudo gmake install || exit 1
	gmake installcheck; _ret=$?; cat ./tests/testsuite.log; if ((_ret!=0)) ; then exit 1; fi

	if ((${#TRAVIS_JOB_ID}>0)) ; then
		echo 'Sending coverage reports...'
		kcov --coveralls-id="$TRAVIS_JOB_ID" --bash-parser="$(which bash)" --bash-dont-parse-binary-dir --include-pattern='po2bats.sh' --exclude-pattern='po2bats.sh.in' ./tests/coverage po2bats.sh
		bash <(curl -s https://codecov.io/bash) -s ./tests/coverage
	fi

	sudo gmake uninstall; _ret=$?; cat ./config.log; if ((_ret!=0)) ; then exit 1; fi
	gmake clean || exit 1
	gmake distclean || exit 1
	;;
* )
	printf '\033[0;31mUnknown value: TRAVIS_OS_NAME=%s\033[0m\n' $TRAVIS_OS_NAME >&2 &&
	exit 1 ;;
esac
