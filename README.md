<!--
Document File Format:
	- GFM (GitHub Flavored Markdown)
References:
	- [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
	- [Markdown Editor](https://jbt.github.io/markdown-editor/)
	- [A template to make good README.md](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
-->

# po2bats

This is a shell script to generate BATS file from PO file.
Running the bats script allows you to test the integrity of MO files installed on your system and PO files that is the sources.

Note:
- See [The Format of PO Files](https://www.gnu.org/software/gettext/manual/html_node/PO-Files.html).
- See [The Format of MO Files](https://www.gnu.org/software/gettext/manual/html_node/MO-Files.html).
- See [Bats: Bash Automated Testing System](https://github.com/sstephenson/bats).

Some of usages of this command are shown below.

How to display help:
```
$ po2bats.sh --help
Usage: po2bats.sh [OPTION] PO BATS TEXTDOMAIN
Generate BATS file from PO file

OPTION:
      --msgdir=TEXTDOMAINDIR  Specify message catalog search path
      --msginfo               Display message catalog information and exit
      --help                  Display this help and exit
      --version               Display version information and exit

PO: Specify the name of an existing PO file
BATS: Specify the name of a new BATS file
TEXTDOMAIN,TEXTDOMAINDIR:
  See gettext command help for more information: gettext --help

URL: https://github.com/kimkim19642004/po2bats-autotools
Report bugs to: kim <kimkim19642004@yahoo.co.jp>
```

How to generate and execute BATS file (Example in Japanese locale):
```
$ echo $LANG
ja_JP.UTF-8
$ po2bats.sh --msgdir=/usr/local/share/locale ja.po ja.bats test
$ ja.bats
```
Note:
- 'ja.po' is an existing Japanese PO file.
- Place Japanese MO file 'test.mo' in the directory '/usr/local/share/locale/ja/LC_MESSAGES'.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Install necessary packages for installing this software.

When the latest version of [Fedora](https://getfedora.org/) is clean installed:
```
$ sudo dnf install dnf-plugins-extras-tracer
$ sudo dnf upgrade
```
Follow instructions of the DNF command, restart the specified applications, or reboot your system, or login to your system again.

Note:
- If Plugin for DNF command [dnf-plugins-extras-tracer](http://tracer.readthedocs.io/en/latest/user-guide/) is installed on your system, the DNF command will display information about running applications that need to be restarted. This plugin is useful, but it may take time to execute. To disable this plugin, specify '--disableplugin=tracer' as the command option.

Install Development Tools:
```
$ sudo dnf install bats
$ sudo dnf install git-gui
```

### Installing

The installation procedure of this software is as follows:
```
$ cd $HOME
$ git clone https://github.com/kimkim19642004/po2bats-autotools.git
$ cd po2bats-0.1.0
$ ./configure && make
$ make check
$ sudo make install
$ make installcheck
```
Note:
- See 'INSTALL' for more information.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see [po2bats-autotools](https://github.com/kimkim19642004/po2bats-autotools). 

## Authors

See 'AUTHORS' for more information.

## License

See 'COPYING' for more information.

## NEWS

This is the latest information on development environment.
See 'NEWS' for more information.

