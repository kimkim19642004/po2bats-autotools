dnl Process this file with autoconf to produce a configure script.

dnl ### Settings for Configure ###
AC_PREREQ(2.59)
dnl ## Sepecify revision no.
AC_REVISION($Revision: 0.1.0 $)
AC_COPYRIGHT(Copyright (c) 2018 kim)
dnl ## Sepecify version no.
AC_INIT(po2bats, 0.1.0, kim <kimkim19642004@yahoo.co.jp>, ,https://github.com/kimkim19642004/po2bats-autotools)

dnl ### Settings for Makefile ###
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE(check-news std-options no-dist-gzip dist-xz)

dnl ### Settings for Autotest ###
AX_GNU_AUTOTEST

dnl ### Settings for Internationalization ###
dnl ## Be careful where you define the AM_GNU_GETTEXT macro.
dnl ## See [configure.ac at top level](https://www.gnu.org/software/gettext/manual/html_node/configure_002eac.html)
AM_GNU_GETTEXT_VERSION([0.19.8])
AM_GNU_GETTEXT([external])

dnl ### Settings for Configuration files ###
AC_CONFIG_FILES(Makefile src/Makefile src/po2bats.sh po/Makefile.in, chmod +x src/po2bats.sh)
AC_OUTPUT
