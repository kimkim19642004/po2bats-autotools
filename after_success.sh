#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
linux )
	# Note: If the '--report-only' option is specified, the collected coverage is reported as 0.0%.
	cd tests
	kcov --coveralls-id=$TRAVIS_JOB_ID --bash-parser="$(which bash)" --bash-dont-parse-binary-dir --include-pattern=po2bats.sh --exclude-pattern=po2bats.sh.in coverage po2bats.sh
	bash <(curl -s https://codecov.io/bash) -s coverage ;;
osx )
	MANPATH=$(brew --prefix coreutils)/libexec/gnubin:$MANPATH
	PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
	PATH=$(brew --prefix gettext)/bin:$PATH
	PATH=$(brew --prefix gnu-getopt)/bin:$PATH
	export PATH MANPATH

	# Note: If the '--report-only' option is specified, the collected coverage is reported as 0.0%.
	cd tests
	kcov --coveralls-id=$TRAVIS_JOB_ID --bash-parser="$(which bash)" --bash-dont-parse-binary-dir --include-pattern=po2bats.sh --exclude-pattern=po2bats.sh.in coverage po2bats.sh
	bash <(curl -s https://codecov.io/bash) -s coverage ;;
* )
	printf '\033[0;31mUnknown value: TRAVIS_OS_NAME=%s\033[0m\n' $TRAVIS_OS_NAME >&2
	exit 1 ;;
esac
