#!/usr/bin/env bash

case "$TRAVIS_OS_NAME" in
linux )
	sudo apt update
	# Note: Running 'sudo apt upgrade' is time consuming and unnecessary.
	# sudo apt upgrade
	sudo apt install bats moreutils shellcheck

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
osx )
	brew install bats-core
	brew install moreutils
	brew install shellcheck
	brew install gnu-getopt

	# Note:
	# If there is any problem with the package installed by the command 'brew install kcov',
	# try installing 'kcov' from https://github.com/SimonKagstrom/kcov/.
	cd $HOME
	brew install zlib
	brew install bash
	brew install pkgconfig
	git clone https://github.com/SimonKagstrom/kcov.git
	cd kcov
	mkdir build
	cd build
	cmake ..
	make
	sudo make install ;;
* )
	printf '\033[0;31mUnknown value: TRAVIS_OS_NAME=%s\033[0m\n' $TRAVIS_OS_NAME >&2
	exit 1 ;;
esac
