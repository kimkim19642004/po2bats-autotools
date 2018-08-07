dnl Process this file with autoconf to produce a configure script.

dnl ### Settings for Configure ###
AC_PREREQ(2.59)
dnl ## Sepecify revision no.
AC_REVISION($Revision: 0.1.3 $)
AC_COPYRIGHT(Copyright (c) 2018-2019 kim)
dnl ## Sepecify version no.
AC_INIT(po2bats, 0.1.1,
	https://github.com/kimkim19642004/po2bats-autotools/issues,,
	https://github.com/kimkim19642004/po2bats-autotools)

dnl ### Settings for Makefile ###
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE(check-news std-options no-dist-gzip dist-xz)

dnl ### Settings for portability of Commands and Shell Scripts ###
dnl ## Check for the existence of required packages.
dnl ## It is not necessary to check all the existence of Commands.
AC_SYS_INTERPRETER
AS_IF(test ${interpval} = no, [AC_MSG_FAILURE(Shebang '@%:@!' is not supported in this system.)])
VAR_NAME=env; VAR_PATH=/usr/bin; AC_PATH_PROG(VAR_ENV, ${VAR_NAME}, no, ${VAR_PATH})
AS_IF(test x${VAR_ENV} = xno, [AC_MSG_FAILURE([${VAR_PATH}/${VAR_NAME}: command not found. Package 'coreutils' not installed, or invalid path/link settings.])])
VAR_NAME=bash; AC_PATH_PROG(VAR_BASH, ${VAR_NAME}, no)
AS_IF(test x${VAR_BASH} = xno, [AC_MSG_FAILURE([${VAR_NAME}: command not found. Package '${VAR_NAME}' not installed, or invalid path/link settings.])])
VAR_NAME=bats; AC_PATH_PROG(VAR_BATS, ${VAR_NAME}, no)
AS_IF(test x${VAR_BATS} = xno, [AC_MSG_FAILURE([${VAR_NAME}: command not found. Package '${VAR_NAME}' not installed, or invalid path/link settings. See <https://github.com/bats-core/bats-core>.])])
VAR_NAME=gettext; AC_PATH_PROG(VAR_GETTEXT, ${VAR_NAME}, no)
AS_IF(test x${VAR_GETTEXT} = xno, [AC_MSG_FAILURE([${VAR_NAME}: command not found. Package '${VAR_NAME}' not installed, or invalid path/link settings.])])
VAR_NAME=errno; AC_PATH_PROG(VAR_ERRNO, ${VAR_NAME}, no)
AS_IF(test x${VAR_ERRNO} = xno, [AC_MSG_FAILURE([${VAR_NAME}: command not found. Package 'moreutils' not installed, or invalid path/link settings.])])
VAR_NAME=getopt; AC_PATH_PROG(VAR_GETOPT, ${VAR_NAME}, no)
AS_IF(test x${VAR_GETOPT} = xno, [AC_MSG_FAILURE([${VAR_NAME}: command not found. Package 'util-linux' not installed, or invalid path/link settings.])])
VAR_NAME=diff; AC_PATH_PROG(VAR_DIFF, ${VAR_NAME}, no)
AS_IF(test x${VAR_DIFF} = xno, [AC_MSG_FAILURE([${VAR_NAME}: command not found. Package 'diffutils' not installed, or invalid path/link settings.])])
VAR_NAME=kcov; AC_PATH_PROG(VAR_KCOV, ${VAR_NAME}, no)
AS_IF(test x${VAR_KCOV} = xno, [AC_MSG_FAILURE([${VAR_NAME}: command not found. Package '${VAR_NAME}' not installed, or invalid path/link settings. See <https://github.com/SimonKagstrom/kcov/>.])])
VAR_NAME=shellcheck; AC_PATH_PROG(VAR_SHELLCHECK, ${VAR_NAME}, no)
AS_IF(test x${VAR_SHELLCHECK} = xno, [AC_MSG_FAILURE([${VAR_NAME}: command not found. Package 'ShellCheck' not installed, or invalid path/link settings.])])
dnl ## Check if AWK supports printf() function.
AX_CHECK_AWK_PRINTF
dnl ## Note: AC_PATH_PROGS_FEATURE_CHECK: can not avoids error checking by Autoconf editor.
VAR_FLAG=no; AC_PATH_PROGS_FEATURE_CHECK(GETOPT_FEATURE, getopt, [
	AC_MSG_CHECKING($ac_path_GETOPT_FEATURE --test)
	AS_UNSET(GETOPT_COMPATIBLE)
	${ac_path_GETOPT_FEATURE} --test >/dev/null 2>&1; _n=$?
	AS_IF(test ${_n} -eq 4,
		AS_IF(test x${VAR_FLAG}=xno, ac_cv_path_GETOPT_FEATURE=${ac_path_GETOPT_FEATURE})
		AC_MSG_RESULT(exit ${_n}: This is a GNU command.),
		AC_MSG_RESULT(exit ${_n}: This is not a GNU command.))
	VAR_FLAG=yes
], [AC_MSG_FAILURE([getopt: This GNU command is not installed[,] or invalid path/link settings.])])
dnl ## Note: AC_PATH_PROGS_FEATURE_CHECK: can not avoids error checking by Autoconf editor.
VAR_FLAG=no; AC_PATH_PROGS_FEATURE_CHECK(MKTEMP_FEATURE, [mktemp gmktemp], [
	AC_MSG_CHECKING($ac_path_MKTEMP_FEATURE --version)
	${ac_path_MKTEMP_FEATURE} --version >/dev/null 2>&1; _n=$?
	AS_IF(test ${_n} -eq 0,
		AS_IF(test x${VAR_FLAG}=xno, ac_cv_path_MKTEMP_FEATURE=${ac_path_MKTEMP_FEATURE})
		AC_MSG_RESULT(exit ${_n}: This is a GNU command.),
		AC_MSG_RESULT(exit ${_n}: This is not a GNU command.))
	VAR_FLAG=yes
], [AC_MSG_FAILURE([mktemp: This GNU command is not installed[,] or invalid path/link settings.])])
dnl ## Note: AC_PATH_PROGS_FEATURE_CHECK: can not avoids error checking by Autoconf editor.
VAR_FLAG=no; AC_PATH_PROGS_FEATURE_CHECK(REALPATH_FEATURE, [realpath grealpath], [
	AC_MSG_CHECKING($ac_path_REALPATH_FEATURE --version)
	${ac_path_REALPATH_FEATURE} --version >/dev/null 2>&1; _n=$?
	AS_IF(test ${_n} -eq 0,
		AS_IF(test x${VAR_FLAG}=xno, ac_cv_path_REALPATH_FEATURE=${ac_path_REALPATH_FEATURE})
		AC_MSG_RESULT(exit ${_n}: This is a GNU command.),
		AC_MSG_RESULT(exit ${_n}: This is not a GNU command.))
	VAR_FLAG=yes
], [AC_MSG_FAILURE([realpath: This GNU command is not installed[,] or invalid path/link settings.])])
dnl ## Note: AC_PATH_PROGS_FEATURE_CHECK: can not avoids error checking by Autoconf editor.
VAR_FLAG=no; AC_PATH_PROGS_FEATURE_CHECK(SHA256SUM_FEATURE, [sha256sum gsha256sum], [
	AC_MSG_CHECKING($ac_path_SHA256SUM_FEATURE --version)
	${ac_path_SHA256SUM_FEATURE} --version >/dev/null 2>&1; _n=$?
	AS_IF(test ${_n} -eq 0,
		AS_IF(test x${VAR_FLAG}=xno, ac_cv_path_SHA256SUM_FEATURE=${ac_path_SHA256SUM_FEATURE})
		AC_MSG_RESULT(exit ${_n}: This is a GNU command.),
		AC_MSG_RESULT(exit ${_n}: This is not a GNU command.))
	VAR_FLAG=yes
], [AC_MSG_FAILURE([sha256sum: This GNU command is not installed[,] or invalid path/link settings.])])
dnl ## Note: AC_PATH_PROGS_FEATURE_CHECK: can not avoids error checking by Autoconf editor.
VAR_FLAG=no; AC_PATH_PROGS_FEATURE_CHECK(CHMOD_FEATURE, [chmod gchmod], [
	AC_MSG_CHECKING($ac_path_CHMOD_FEATURE --version)
	${ac_path_CHMOD_FEATURE} --version >/dev/null 2>&1; _n=$?
	AS_IF(test ${_n} -eq 0,
		AS_IF(test x${VAR_FLAG}=xno, ac_cv_path_CHMOD_FEATURE=${ac_path_CHMOD_FEATURE})
		AC_MSG_RESULT(exit ${_n}: This is a GNU command.),
		AC_MSG_RESULT(exit ${_n}: This is not a GNU command.))
	VAR_FLAG=yes
], [AC_MSG_FAILURE([chmod: This GNU command is not installed[,] or invalid path/link settings.])])
dnl ## Note: AC_PATH_PROGS_FEATURE_CHECK: can not avoids error checking by Autoconf editor.
VAR_FLAG=no; AC_PATH_PROGS_FEATURE_CHECK(MV_FEATURE, [mv gmv], [
	AC_MSG_CHECKING($ac_path_MV_FEATURE --version)
	${ac_path_MV_FEATURE} --version >/dev/null 2>&1; _n=$?
	AS_IF(test ${_n} -eq 0,
		AS_IF(test x${VAR_FLAG}=xno, ac_cv_path_MV_FEATURE=${ac_path_MV_FEATURE})
		AC_MSG_RESULT(exit ${_n}: This is a GNU command.),
		AC_MSG_RESULT(exit ${_n}: This is not a GNU command.))
	VAR_FLAG=yes
], [AC_MSG_FAILURE([mv: This GNU command is not installed[,] or invalid path/link settings.])])

dnl ### Settings for Code coverage ###
AC_ARG_ENABLE(testcode,
	AS_HELP_STRING(--enable-testcode, [Enable embedding test code to help improve code coverage (default is no)]),
	[AC_SUBST(SHCMT, '')], [AC_SUBST(SHCMT, '@%:@')])

dnl ### Settings for Autotest ###
AX_GNU_AUTOTEST

dnl ### Settings for Internationalization and localization ###
dnl ## Be careful where you define the AM_GNU_GETTEXT macro.
dnl ## See [configure.ac at top level](https://www.gnu.org/software/gettext/manual/html_node/configure_002eac.html)
AM_GNU_GETTEXT_VERSION([0.19.8])
AM_GNU_GETTEXT([external])

dnl ### Settings for Configuration files ###
AC_CONFIG_FILES(Makefile src/Makefile po/Makefile.in tests/atlocal)
dnl ## File composition required for CI (Continuous Integration) using GitHub:
dnl ## In order to accurately measure the coverage, it is necessary to match the contents of 'src/po2bats.sh' and 'tests/po2bats.sh'.
AC_CONFIG_FILES(src/po2bats.sh, chmod +x src/po2bats.sh)
dnl ## What is 'README.md'?:
dnl ## 'README.md' is the file needed to view 'README' on GitHub.
AC_CONFIG_LINKS(tests/po2bats.sh:src/po2bats.sh README.md:README)

AC_OUTPUT
