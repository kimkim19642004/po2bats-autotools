#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
'linux' )
	## Note: Avoid the following errors on 'Ubuntu 16.04 LTS'.
	## configure: error: You must have one of the following versions of lcov: 1.6 1.7 1.8 1.9 1.10 1.11 (found: 1.12).
	## See [PPA for autotools](http://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=history;f=m4/ax_code_coverage.m4):
	##	- 2016-12-06 Kevin Locke ax_code_coverage: remove lcov version check.
	##	- 2015-11-23 Emil Mikulic: Add 1.12 to list of lcov versions.
	## See [Staging PPA](https://launchpad.net/~ricotz/+archive/ubuntu/staging):
	##	- autoconf-archive: 20160916-1~16.04~ricotz1
	if [ "$TRAVIS_DIST_NAME" = 'xenial' ] ; then
		sudo apt install -y software-properties-common
		sudo add-apt-repository -y ppa:ricotz/staging
	fi

	## Installing and updating basic software
	sudo apt update
	sudo apt install -y "language-pack-${LANG%%_*}"
	sudo apt install -y llvm
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
	brew install zlib
	brew install bash
	brew install pkgconfig

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
'BSD' )
	## Installing and updating basic software
	sudo pkg install -y llvm
	sudo pkg install -y gcc gmake coreutils getopt git
	sudo pkg install -y autotools gettext-tools expect autoconf-archive
	sudo pkg install -y bats-core moreutils lcov hs-ShellCheck

	## Requires for [kcov](https://github.com/SimonKagstrom/kcov/)
	sudo pkg install -y binutils cmake elfutils python

	## Create symbolic links to GNU commands with 'g' prefix as follows:
	sudo ln -s /usr/local/bin/gmktemp /usr/local/bin/mktemp
	sudo ln -s /usr/local/bin/grealpath /usr/local/bin/realpath
	sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
	sudo ln -s /usr/local/bin/gchmod /usr/local/bin/chmod
	sudo ln -s /usr/local/bin/gmv /usr/local/bin/mv

	## If symbolic links for 'gcc' and 'g++' are not created:
	#sudo ln -s /usr/local/bin/gcc8 /usr/local/bin/gcc
	#sudo ln -s /usr/local/bin/g++8 /usr/local/bin/g++

	## Create a symbolic link for 'gcov'.
	sudo ln -s /usr/local/bin/gcov8 /usr/local/bin/gcov

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
