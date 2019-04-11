#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
'linux' )
	## Note: Avoid the following errors on 'Ubuntu 16.04 LTS'.
	if [[ $TRAVIS_DIST = 'xenial' ]] ; then
		sudo apt install -y software-properties-common

		## configure: error: You must have one of the following versions of lcov: 1.6 1.7 1.8 1.9 1.10 1.11 (found: 1.12).
		## See [PPA for autotools](http://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=history;f=m4/ax_code_coverage.m4):
		##  - 2016-12-06 Kevin Locke ax_code_coverage: remove lcov version check.
		##  - 2015-11-23 Emil Mikulic: Add 1.12 to list of lcov versions.
		## See [GNU](https://launchpad.net/~dns/+archive/ubuntu/gnu):
		##  - autoconf-archive: 20190106-2~16.04 
		sudo add-apt-repository -y ppa:dns/gnu

		## shellcheck error: hGetContents: invalid argument (invalid byte sequence)
		## See [ShellCheck](https://launchpad.net/~unilogicbv/+archive/ubuntu/shellcheck):
		##  - shellcheck: 0.7.1-1~16.04.sav0
		sudo add-apt-repository -y ppa:savoury1/build-tools
	fi

	## Installing and updating basic software
	sudo apt update
	sudo apt install -y "language-pack-${LANG%%_*}"
	sudo apt install -y gettext llvm
	sudo apt install -y autopoint expect autoconf-archive
	sudo apt install -y bats moreutils lcov shellcheck

	## Requires for [kcov](https://github.com/SimonKagstrom/kcov/)
	sudo apt install -y binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev

	## Install [kcov](https://github.com/SimonKagstrom/kcov/)
	cd $HOME
	git clone https://github.com/SimonKagstrom/kcov.git
	cd kcov
	mkdir build
	cd build
	cmake ..
	make
	sudo make install
	;;
'osx' )
	## Installing and updating basic software
	brew install expect
	brew install autoconf-archive
	brew install bats-core
	brew install moreutils
	brew install lcov
	brew install shellcheck
	brew install gnu-getopt

	## Requires for [kcov](https://github.com/SimonKagstrom/kcov/)
	brew install bash
	brew install make
	brew install cmake || brew upgrade cmake
	brew install python || brew upgrade python
	brew upgrade pkgconfig
	brew upgrade zlib

	## Set environment variables.
	## Note: Add the path for "llvm-cov" to the end.
	## See: [Xcode Build Settings Reference](https://pewpewthespells.com/blog/buildsettings.html)
	_s=$(clang --version | grep 'InstalledDir: ')
	DT_TOOLCHAIN_DIR=${_s#InstalledDir: }
	PATH=$PATH:$DT_TOOLCHAIN_DIR
	PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
	PATH=$(brew --prefix make)/libexec/gnubin:$PATH
	PATH=$(brew --prefix gettext)/bin:$PATH
	PATH=$(brew --prefix gnu-getopt)/bin:$PATH
	OPENSSL_ROOT_DIR=$(brew --prefix openssl)
	export PATH OPENSSL_ROOT_DIR

	## Install [kcov](https://github.com/SimonKagstrom/kcov/)
	cd $HOME
	git clone https://github.com/SimonKagstrom/kcov.git
	cd kcov
	mkdir build
	cd build
	## See [Installing on OSX, kcov can't find LLDB #166](https://github.com/SimonKagstrom/kcov/issues/166)
	## See [kcov/INSTALL.md](https://github.com/SimonKagstrom/kcov/blob/master/INSTALL.md)
	## Basic build instructions for 'macOS 10.13/10.14':
	cmake ..
	make
	make install
	## Temporary build instructions for 'macOS 10.15':
	#cmake -G Xcode ..
	#xcodebuild -target kcov -configuration Release
	#cp src/Release/kcov /usr/local/bin
	;;
'BSD' )
	## Installing and updating basic software
	sudo pkg install -y llvm
	sudo pkg install -y gcc gmake coreutils getopt git
	sudo pkg install -y autotools gettext-tools expect autoconf-archive
	sudo pkg install -y bats-core moreutils lcov hs-ShellCheck

	## Requires for [kcov](https://github.com/SimonKagstrom/kcov/)
	sudo pkg install -y binutils cmake python
	## (FreeBSD 11) pkg: No packages available to install matching 'elfutils' have been found in the repositories
	## See: https://www.freshports.org/devel/elfutils/
	sudo pkg install -y elfutils || cd /usr/ports/devel/elfutils/ && sudo make -DBATCH install clean

	## Create symbolic links for GNU commands without 'g' prefix as follows:
	sudo ln -s /usr/local/bin/gmktemp /usr/local/bin/mktemp
	sudo ln -s /usr/local/bin/grealpath /usr/local/bin/realpath
	sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
	sudo ln -s /usr/local/bin/gchmod /usr/local/bin/chmod
	sudo ln -s /usr/local/bin/gmv /usr/local/bin/mv

	## Create symbolic links for GNU commands without version number as follows:
	ls /usr/local/bin/gcov || sudo ln -s /usr/local/bin/gcov9 /usr/local/bin/gcov

	## Set environment variables.
	BATS_ROOT="/usr/local"
	PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
	PATH="$BATS_ROOT/libexec/bats-core:$PATH"
	export BATS_ROOT
	export PATH

	## Install [kcov](https://github.com/SimonKagstrom/kcov/)
	cd $HOME
	git clone https://github.com/SimonKagstrom/kcov.git
	cd kcov
	mkdir build
	cd build
	cmake ..
	make
	sudo make install
	;;
* )
	printf '\033[0;31mUnknown value: TRAVIS_OS_NAME=%s\033[0m\n' $TRAVIS_OS_NAME >&2
	exit 1 ;;
esac
