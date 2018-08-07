#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
'linux' )
	# Note: Avoid the following errors on 'Ubuntu 16.04 LTS'.
	# configure: error: You must have one of the following versions of lcov: 1.6 1.7 1.8 1.9 1.10 1.11 (found: 1.12).
	# See [PPA for autotools](http://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=history;f=m4/ax_code_coverage.m4):
	#	- 2016-12-06 Kevin Locke ax_code_coverage: remove lcov version check.
	#	- 2015-11-23 Emil Mikulic: Add 1.12 to list of lcov versions.
	# See [Staging PPA](https://launchpad.net/~ricotz/+archive/ubuntu/staging):
	#	- autoconf-archive: 20160916-1~16.04~ricotz1
	sudo apt install software-properties-common
	sudo add-apt-repository -y ppa:ricotz/staging

	sudo apt update
	sudo apt install autopoint expect autoconf-archive
	sudo apt install bats moreutils lcov shellcheck

	# Note:
	# If there is any problem with the package installed by the command 'sudo apt install kcov',
	# try installing 'kcov' from https://github.com/SimonKagstrom/kcov/.
	cd $HOME
	sudo apt install binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev
	git clone https://github.com/SimonKagstrom/kcov.git
	cd kcov
	mkdir build
	cd build
	cmake ..
	make
	sudo make install ;;
'osx' )
	brew install expect
	brew install autoconf-archive
	brew install bats-core
	brew install moreutils
	brew install lcov
	brew install shellcheck
	brew install gnu-getopt

	# Note:
	# If there is any problem with the package installed by the command 'brew install kcov',
	# try installing 'kcov' from https://github.com/SimonKagstrom/kcov/.
	cd $HOME
	brew install zlib
	brew install bash
	brew install pkgconfig
	# Note: The following process seems to have no problem even if you do not set 'PATH'.
	git clone https://github.com/SimonKagstrom/kcov.git
	cd kcov
	mkdir build
	cd build
	cmake ..
	make
	make install ;;
* )
	printf '\033[0;31mUnknown value: TRAVIS_OS_NAME=%s\033[0m\n' $TRAVIS_OS_NAME >&2
	exit 1 ;;
esac
