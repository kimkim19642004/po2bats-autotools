# generated automatically by aclocal 1.16.1 -*- Autoconf -*-

# Copyright (C) 1996-2018 Free Software Foundation, Inc.

# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

m4_ifndef([AC_CONFIG_MACRO_DIRS], [m4_defun([_AM_CONFIG_MACRO_DIRS], [])m4_defun([AC_CONFIG_MACRO_DIRS], [_AM_CONFIG_MACRO_DIRS($@)])])
m4_ifndef([AC_AUTOCONF_VERSION],
  [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.69],,
[m4_warning([this file was generated for autoconf 2.69.
You have another version of autoconf.  It may work, but is not guaranteed to.
If you have problems, you may need to regenerate the build system entirely.
To do so, use the procedure documented by the package, typically 'autoreconf'.])])

# ===========================================================================
#   https://www.gnu.org/software/autoconf-archive/ax_ac_append_to_file.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_AC_APPEND_TO_FILE([FILE],[DATA])
#
# DESCRIPTION
#
#   Appends the specified data to the specified Autoconf is run. If you want
#   to append to a file when configure is run use AX_APPEND_TO_FILE instead.
#
# LICENSE
#
#   Copyright (c) 2009 Allan Caffee <allan.caffee@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 10

AC_DEFUN([AX_AC_APPEND_TO_FILE],[
AC_REQUIRE([AX_FILE_ESCAPES])
m4_esyscmd(
AX_FILE_ESCAPES
[
printf "%s" "$2" >> "$1"
])
])

# ===========================================================================
#   https://www.gnu.org/software/autoconf-archive/ax_ac_print_to_file.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_AC_PRINT_TO_FILE([FILE],[DATA])
#
# DESCRIPTION
#
#   Writes the specified data to the specified file when Autoconf is run. If
#   you want to print to a file when configure is run use AX_PRINT_TO_FILE
#   instead.
#
# LICENSE
#
#   Copyright (c) 2009 Allan Caffee <allan.caffee@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 10

AC_DEFUN([AX_AC_PRINT_TO_FILE],[
m4_esyscmd(
AC_REQUIRE([AX_FILE_ESCAPES])
[
printf "%s" "$2" > "$1"
])
])

# ===========================================================================
#  https://www.gnu.org/software/autoconf-archive/ax_add_am_macro_static.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_ADD_AM_MACRO_STATIC([RULE])
#
# DESCRIPTION
#
#   Adds the specified rule to $AMINCLUDE.
#
# LICENSE
#
#   Copyright (c) 2009 Tom Howard <tomhoward@users.sf.net>
#   Copyright (c) 2009 Allan Caffee <allan.caffee@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 8

AC_DEFUN([AX_ADD_AM_MACRO_STATIC],[
  AC_REQUIRE([AX_AM_MACROS_STATIC])
  AX_AC_APPEND_TO_FILE(AMINCLUDE_STATIC,[$1])
])

# ===========================================================================
#   https://www.gnu.org/software/autoconf-archive/ax_am_macros_static.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_AM_MACROS_STATIC
#
# DESCRIPTION
#
#   Adds support for macros that create Automake rules. You must manually
#   add the following line
#
#     include $(top_srcdir)/aminclude_static.am
#
#   to your Makefile.am files.
#
# LICENSE
#
#   Copyright (c) 2009 Tom Howard <tomhoward@users.sf.net>
#   Copyright (c) 2009 Allan Caffee <allan.caffee@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 11

AC_DEFUN([AMINCLUDE_STATIC],[aminclude_static.am])

AC_DEFUN([AX_AM_MACROS_STATIC],
[
AX_AC_PRINT_TO_FILE(AMINCLUDE_STATIC,[
# ]AMINCLUDE_STATIC[ generated automatically by Autoconf
# from AX_AM_MACROS_STATIC on ]m4_esyscmd([LC_ALL=C date])[
])
])

# ===========================================================================
#   https://www.gnu.org/software/autoconf-archive/ax_check_awk_printf.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_CHECK_AWK_PRINTF([ACTION-IF-SUCCESS],[ACTION-IF-FAILURE])
#
# DESCRIPTION
#
#   Check if AWK supports printf() function. If successful execute
#   ACTION-IF-SUCCESS otherwise ACTION-IF-FAILURE.
#
#   This work is heavily based upon testawk.sh script by Heiner Steven. You
#   should find his script (and related works) at
#   <http://www.shelldorado.com/articles/awkcompat.html>. Thanks to
#   Alessandro Massignan for his suggestions and extensive nawk tests on
#   FreeBSD.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 9

AC_DEFUN([AX_CHECK_AWK_PRINTF], [
  AX_TRY_AWK_EXPOUT([printf()],
    [],[ printf("%s\n", "X") ],[X],
    [$1],[$2])
])

# ===========================================================================
#    https://www.gnu.org/software/autoconf-archive/ax_check_gnu_make.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_CHECK_GNU_MAKE([run-if-true],[run-if-false])
#
# DESCRIPTION
#
#   This macro searches for a GNU version of make. If a match is found:
#
#     * The makefile variable `ifGNUmake' is set to the empty string, otherwise
#       it is set to "#". This is useful for including a special features in a
#       Makefile, which cannot be handled by other versions of make.
#     * The makefile variable `ifnGNUmake' is set to #, otherwise
#       it is set to the empty string. This is useful for including a special
#       features in a Makefile, which can be handled
#       by other versions of make or to specify else like clause.
#     * The variable `_cv_gnu_make_command` is set to the command to invoke
#       GNU make if it exists, the empty string otherwise.
#     * The variable `ax_cv_gnu_make_command` is set to the command to invoke
#       GNU make by copying `_cv_gnu_make_command`, otherwise it is unset.
#     * If GNU Make is found, its version is extracted from the output of
#       `make --version` as the last field of a record of space-separated
#       columns and saved into the variable `ax_check_gnu_make_version`.
#     * Additionally if GNU Make is found, run shell code run-if-true
#       else run shell code run-if-false.
#
#   Here is an example of its use:
#
#   Makefile.in might contain:
#
#     # A failsafe way of putting a dependency rule into a makefile
#     $(DEPEND):
#             $(CC) -MM $(srcdir)/*.c > $(DEPEND)
#
#     @ifGNUmake@ ifeq ($(DEPEND),$(wildcard $(DEPEND)))
#     @ifGNUmake@ include $(DEPEND)
#     @ifGNUmake@ else
#     fallback code
#     @ifGNUmake@ endif
#
#   Then configure.in would normally contain:
#
#     AX_CHECK_GNU_MAKE()
#     AC_OUTPUT(Makefile)
#
#   Then perhaps to cause gnu make to override any other make, we could do
#   something like this (note that GNU make always looks for GNUmakefile
#   first):
#
#     if  ! test x$_cv_gnu_make_command = x ; then
#             mv Makefile GNUmakefile
#             echo .DEFAULT: > Makefile ;
#             echo \  $_cv_gnu_make_command \$@ >> Makefile;
#     fi
#
#   Then, if any (well almost any) other make is called, and GNU make also
#   exists, then the other make wraps the GNU make.
#
# LICENSE
#
#   Copyright (c) 2008 John Darrington <j.darrington@elvis.murdoch.edu.au>
#   Copyright (c) 2015 Enrico M. Crisostomo <enrico.m.crisostomo@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 11

AC_DEFUN([AX_CHECK_GNU_MAKE],dnl
  [AC_PROG_AWK
  AC_CACHE_CHECK([for GNU make],[_cv_gnu_make_command],[dnl
    _cv_gnu_make_command="" ;
dnl Search all the common names for GNU make
    for a in "$MAKE" make gmake gnumake ; do
      if test -z "$a" ; then continue ; fi ;
      if "$a" --version 2> /dev/null | grep GNU 2>&1 > /dev/null ; then
        _cv_gnu_make_command=$a ;
        AX_CHECK_GNU_MAKE_HEADLINE=$("$a" --version 2> /dev/null | grep "GNU Make")
        ax_check_gnu_make_version=$(echo ${AX_CHECK_GNU_MAKE_HEADLINE} | ${AWK} -F " " '{ print $(NF); }')
        break ;
      fi
    done ;])
dnl If there was a GNU version, then set @ifGNUmake@ to the empty string, '#' otherwise
  AS_VAR_IF([_cv_gnu_make_command], [""], [AS_VAR_SET([ifGNUmake], ["#"])],   [AS_VAR_SET([ifGNUmake], [""])])
  AS_VAR_IF([_cv_gnu_make_command], [""], [AS_VAR_SET([ifnGNUmake], [""])],   [AS_VAR_SET([ifGNUmake], ["#"])])
  AS_VAR_IF([_cv_gnu_make_command], [""], [AS_UNSET(ax_cv_gnu_make_command)], [AS_VAR_SET([ax_cv_gnu_make_command], [${_cv_gnu_make_command}])])
  AS_VAR_IF([_cv_gnu_make_command], [""],[$2],[$1])
  AC_SUBST([ifGNUmake])
  AC_SUBST([ifnGNUmake])
])

# ===========================================================================
#     https://www.gnu.org/software/autoconf-archive/ax_code_coverage.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_CODE_COVERAGE()
#
# DESCRIPTION
#
#   Defines CODE_COVERAGE_CPPFLAGS, CODE_COVERAGE_CFLAGS,
#   CODE_COVERAGE_CXXFLAGS and CODE_COVERAGE_LIBS which should be included
#   in the CPPFLAGS, CFLAGS CXXFLAGS and LIBS/LIBADD variables of every
#   build target (program or library) which should be built with code
#   coverage support. Also add rules using AX_ADD_AM_MACRO_STATIC; and
#   $enable_code_coverage which can be used in subsequent configure output.
#   CODE_COVERAGE_ENABLED is defined and substituted, and corresponds to the
#   value of the --enable-code-coverage option, which defaults to being
#   disabled.
#
#   Test also for gcov program and create GCOV variable that could be
#   substituted.
#
#   Note that all optimization flags in CFLAGS must be disabled when code
#   coverage is enabled.
#
#   Usage example:
#
#   configure.ac:
#
#     AX_CODE_COVERAGE
#
#   Makefile.am:
#
#     include $(top_srcdir)/aminclude_static.am
#
#     my_program_LIBS = ... $(CODE_COVERAGE_LIBS) ...
#     my_program_CPPFLAGS = ... $(CODE_COVERAGE_CPPFLAGS) ...
#     my_program_CFLAGS = ... $(CODE_COVERAGE_CFLAGS) ...
#     my_program_CXXFLAGS = ... $(CODE_COVERAGE_CXXFLAGS) ...
#
#     clean-local: code-coverage-clean
#     distclean-local: code-coverage-dist-clean
#
#   This results in a "check-code-coverage" rule being added to any
#   Makefile.am which do "include $(top_srcdir)/aminclude_static.am"
#   (assuming the module has been configured with --enable-code-coverage).
#   Running `make check-code-coverage` in that directory will run the
#   module's test suite (`make check`) and build a code coverage report
#   detailing the code which was touched, then print the URI for the report.
#
#   This code was derived from Makefile.decl in GLib, originally licensed
#   under LGPLv2.1+.
#
# LICENSE
#
#   Copyright (c) 2012, 2016 Philip Withnall
#   Copyright (c) 2012 Xan Lopez
#   Copyright (c) 2012 Christian Persch
#   Copyright (c) 2012 Paolo Borelli
#   Copyright (c) 2012 Dan Winship
#   Copyright (c) 2015,2018 Bastien ROUCARIES
#
#   This library is free software; you can redistribute it and/or modify it
#   under the terms of the GNU Lesser General Public License as published by
#   the Free Software Foundation; either version 2.1 of the License, or (at
#   your option) any later version.
#
#   This library is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
#   General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public License
#   along with this program. If not, see <https://www.gnu.org/licenses/>.

#serial 32

m4_define(_AX_CODE_COVERAGE_RULES,[
AX_ADD_AM_MACRO_STATIC([
# Code coverage
#
# Optional:
#  - CODE_COVERAGE_DIRECTORY: Top-level directory for code coverage reporting.
#    Multiple directories may be specified, separated by whitespace.
#    (Default: \$(top_builddir))
#  - CODE_COVERAGE_OUTPUT_FILE: Filename and path for the .info file generated
#    by lcov for code coverage. (Default:
#    \$(PACKAGE_NAME)-\$(PACKAGE_VERSION)-coverage.info)
#  - CODE_COVERAGE_OUTPUT_DIRECTORY: Directory for generated code coverage
#    reports to be created. (Default:
#    \$(PACKAGE_NAME)-\$(PACKAGE_VERSION)-coverage)
#  - CODE_COVERAGE_BRANCH_COVERAGE: Set to 1 to enforce branch coverage,
#    set to 0 to disable it and leave empty to stay with the default.
#    (Default: empty)
#  - CODE_COVERAGE_LCOV_SHOPTS_DEFAULT: Extra options shared between both lcov
#    instances. (Default: based on $CODE_COVERAGE_BRANCH_COVERAGE)
#  - CODE_COVERAGE_LCOV_SHOPTS: Extra options to shared between both lcov
#    instances. (Default: $CODE_COVERAGE_LCOV_SHOPTS_DEFAULT)
#  - CODE_COVERAGE_LCOV_OPTIONS_GCOVPATH: --gcov-tool pathtogcov
#  - CODE_COVERAGE_LCOV_OPTIONS_DEFAULT: Extra options to pass to the
#    collecting lcov instance. (Default: $CODE_COVERAGE_LCOV_OPTIONS_GCOVPATH)
#  - CODE_COVERAGE_LCOV_OPTIONS: Extra options to pass to the collecting lcov
#    instance. (Default: $CODE_COVERAGE_LCOV_OPTIONS_DEFAULT)
#  - CODE_COVERAGE_LCOV_RMOPTS_DEFAULT: Extra options to pass to the filtering
#    lcov instance. (Default: empty)
#  - CODE_COVERAGE_LCOV_RMOPTS: Extra options to pass to the filtering lcov
#    instance. (Default: $CODE_COVERAGE_LCOV_RMOPTS_DEFAULT)
#  - CODE_COVERAGE_GENHTML_OPTIONS_DEFAULT: Extra options to pass to the
#    genhtml instance. (Default: based on $CODE_COVERAGE_BRANCH_COVERAGE)
#  - CODE_COVERAGE_GENHTML_OPTIONS: Extra options to pass to the genhtml
#    instance. (Default: $CODE_COVERAGE_GENHTML_OPTIONS_DEFAULT)
#  - CODE_COVERAGE_IGNORE_PATTERN: Extra glob pattern of files to ignore
#
# The generated report will be titled using the \$(PACKAGE_NAME) and
# \$(PACKAGE_VERSION). In order to add the current git hash to the title,
# use the git-version-gen script, available online.
# Optional variables
# run only on top dir
if CODE_COVERAGE_ENABLED
 ifeq (\$(abs_builddir), \$(abs_top_builddir))
CODE_COVERAGE_DIRECTORY ?= \$(top_builddir)
CODE_COVERAGE_OUTPUT_FILE ?= \$(PACKAGE_NAME)-\$(PACKAGE_VERSION)-coverage.info
CODE_COVERAGE_OUTPUT_DIRECTORY ?= \$(PACKAGE_NAME)-\$(PACKAGE_VERSION)-coverage

CODE_COVERAGE_BRANCH_COVERAGE ?=
CODE_COVERAGE_LCOV_SHOPTS_DEFAULT ?= \$(if \$(CODE_COVERAGE_BRANCH_COVERAGE),\
--rc lcov_branch_coverage=\$(CODE_COVERAGE_BRANCH_COVERAGE))
CODE_COVERAGE_LCOV_SHOPTS ?= \$(CODE_COVERAGE_LCOV_SHOPTS_DEFAULT)
CODE_COVERAGE_LCOV_OPTIONS_GCOVPATH ?= --gcov-tool \"\$(GCOV)\"
CODE_COVERAGE_LCOV_OPTIONS_DEFAULT ?= \$(CODE_COVERAGE_LCOV_OPTIONS_GCOVPATH)
CODE_COVERAGE_LCOV_OPTIONS ?= \$(CODE_COVERAGE_LCOV_OPTIONS_DEFAULT)
CODE_COVERAGE_LCOV_RMOPTS_DEFAULT ?=
CODE_COVERAGE_LCOV_RMOPTS ?= \$(CODE_COVERAGE_LCOV_RMOPTS_DEFAULT)
CODE_COVERAGE_GENHTML_OPTIONS_DEFAULT ?=\
\$(if \$(CODE_COVERAGE_BRANCH_COVERAGE),\
--rc genhtml_branch_coverage=\$(CODE_COVERAGE_BRANCH_COVERAGE))
CODE_COVERAGE_GENHTML_OPTIONS ?= \$(CODE_COVERAGE_GENHTML_OPTIONS_DEFAULT)
CODE_COVERAGE_IGNORE_PATTERN ?=

GITIGNOREFILES = \$(GITIGNOREFILES) \$(CODE_COVERAGE_OUTPUT_FILE) \$(CODE_COVERAGE_OUTPUT_DIRECTORY)
code_coverage_v_lcov_cap = \$(code_coverage_v_lcov_cap_\$(V))
code_coverage_v_lcov_cap_ = \$(code_coverage_v_lcov_cap_\$(AM_DEFAULT_VERBOSITY))
code_coverage_v_lcov_cap_0 = @echo \"  LCOV   --capture\" \$(CODE_COVERAGE_OUTPUT_FILE);
code_coverage_v_lcov_ign = \$(code_coverage_v_lcov_ign_\$(V))
code_coverage_v_lcov_ign_ = \$(code_coverage_v_lcov_ign_\$(AM_DEFAULT_VERBOSITY))
code_coverage_v_lcov_ign_0 = @echo \"  LCOV   --remove /tmp/*\" \$(CODE_COVERAGE_IGNORE_PATTERN);
code_coverage_v_genhtml = \$(code_coverage_v_genhtml_\$(V))
code_coverage_v_genhtml_ = \$(code_coverage_v_genhtml_\$(AM_DEFAULT_VERBOSITY))
code_coverage_v_genhtml_0 = @echo \"  GEN   \" \"\$(CODE_COVERAGE_OUTPUT_DIRECTORY)\";
code_coverage_quiet = \$(code_coverage_quiet_\$(V))
code_coverage_quiet_ = \$(code_coverage_quiet_\$(AM_DEFAULT_VERBOSITY))
code_coverage_quiet_0 = --quiet

# sanitizes the test-name: replaces with underscores: dashes and dots
code_coverage_sanitize = \$(subst -,_,\$(subst .,_,\$(1)))

# Use recursive makes in order to ignore errors during check
check-code-coverage:
	-\$(AM_V_at)\$(MAKE) \$(AM_MAKEFLAGS) -k check
	\$(AM_V_at)\$(MAKE) \$(AM_MAKEFLAGS) code-coverage-capture

# Capture code coverage data
code-coverage-capture: code-coverage-capture-hook
	\$(code_coverage_v_lcov_cap)\$(LCOV) \$(code_coverage_quiet) \$(addprefix --directory ,\$(CODE_COVERAGE_DIRECTORY)) --capture --output-file \"\$(CODE_COVERAGE_OUTPUT_FILE).tmp\" --test-name \"\$(call code_coverage_sanitize,\$(PACKAGE_NAME)-\$(PACKAGE_VERSION))\" --no-checksum --compat-libtool \$(CODE_COVERAGE_LCOV_SHOPTS) \$(CODE_COVERAGE_LCOV_OPTIONS)
	\$(code_coverage_v_lcov_ign)\$(LCOV) \$(code_coverage_quiet) \$(addprefix --directory ,\$(CODE_COVERAGE_DIRECTORY)) --remove \"\$(CODE_COVERAGE_OUTPUT_FILE).tmp\" \"/tmp/*\" \$(CODE_COVERAGE_IGNORE_PATTERN) --output-file \"\$(CODE_COVERAGE_OUTPUT_FILE)\" \$(CODE_COVERAGE_LCOV_SHOPTS) \$(CODE_COVERAGE_LCOV_RMOPTS)
	-@rm -f \"\$(CODE_COVERAGE_OUTPUT_FILE).tmp\"
	\$(code_coverage_v_genhtml)LANG=C \$(GENHTML) \$(code_coverage_quiet) \$(addprefix --prefix ,\$(CODE_COVERAGE_DIRECTORY)) --output-directory \"\$(CODE_COVERAGE_OUTPUT_DIRECTORY)\" --title \"\$(PACKAGE_NAME)-\$(PACKAGE_VERSION) Code Coverage\" --legend --show-details \"\$(CODE_COVERAGE_OUTPUT_FILE)\" \$(CODE_COVERAGE_GENHTML_OPTIONS)
	@echo \"file://\$(abs_builddir)/\$(CODE_COVERAGE_OUTPUT_DIRECTORY)/index.html\"

code-coverage-clean:
	-\$(LCOV) --directory \$(top_builddir) -z
	-rm -rf \"\$(CODE_COVERAGE_OUTPUT_FILE)\" \"\$(CODE_COVERAGE_OUTPUT_FILE).tmp\" \"\$(CODE_COVERAGE_OUTPUT_DIRECTORY)\"
	-find . \\( -name \"*.gcda\" -o -name \"*.gcno\" -o -name \"*.gcov\" \\) -delete

code-coverage-dist-clean:

A][M_DISTCHECK_CONFIGURE_FLAGS = \$(A][M_DISTCHECK_CONFIGURE_FLAGS) --disable-code-coverage
 else # ifneq (\$(abs_builddir), \$(abs_top_builddir))
check-code-coverage:

code-coverage-capture: code-coverage-capture-hook

code-coverage-clean:

code-coverage-dist-clean:
 endif # ifeq (\$(abs_builddir), \$(abs_top_builddir))
else #! CODE_COVERAGE_ENABLED
# Use recursive makes in order to ignore errors during check
check-code-coverage:
	@echo \"Need to reconfigure with --enable-code-coverage\"
# Capture code coverage data
code-coverage-capture: code-coverage-capture-hook
	@echo \"Need to reconfigure with --enable-code-coverage\"

code-coverage-clean:

code-coverage-dist-clean:

endif #CODE_COVERAGE_ENABLED
# Hook rule executed before code-coverage-capture, overridable by the user
code-coverage-capture-hook:

.PHONY: check-code-coverage code-coverage-capture code-coverage-dist-clean code-coverage-clean code-coverage-capture-hook
])
])

AC_DEFUN([_AX_CODE_COVERAGE_ENABLED],[
	AX_CHECK_GNU_MAKE([],[AC_MSG_ERROR([not using GNU make that is needed for coverage])])
	AC_REQUIRE([AX_ADD_AM_MACRO_STATIC])
	# check for gcov
	AC_CHECK_TOOL([GCOV],
		  [$_AX_CODE_COVERAGE_GCOV_PROG_WITH],
		  [:])
	AS_IF([test "X$GCOV" = "X:"],
	      [AC_MSG_ERROR([gcov is needed to do coverage])])
	AC_SUBST([GCOV])

	dnl Check if gcc is being used
	AS_IF([ test "$GCC" = "no" ], [
		AC_MSG_ERROR([not compiling with gcc, which is required for gcov code coverage])
	      ])

	AC_CHECK_PROG([LCOV], [lcov], [lcov])
	AC_CHECK_PROG([GENHTML], [genhtml], [genhtml])

	AS_IF([ test x"$LCOV" = x ], [
		AC_MSG_ERROR([To enable code coverage reporting you must have lcov installed])
	      ])

	AS_IF([ test x"$GENHTML" = x ], [
		AC_MSG_ERROR([Could not find genhtml from the lcov package])
	])

	dnl Build the code coverage flags
	dnl Define CODE_COVERAGE_LDFLAGS for backwards compatibility
	CODE_COVERAGE_CPPFLAGS="-DNDEBUG"
	CODE_COVERAGE_CFLAGS="-O0 -g -fprofile-arcs -ftest-coverage"
	CODE_COVERAGE_CXXFLAGS="-O0 -g -fprofile-arcs -ftest-coverage"
	CODE_COVERAGE_LIBS="-lgcov"

	AC_SUBST([CODE_COVERAGE_CPPFLAGS])
	AC_SUBST([CODE_COVERAGE_CFLAGS])
	AC_SUBST([CODE_COVERAGE_CXXFLAGS])
	AC_SUBST([CODE_COVERAGE_LIBS])
])

AC_DEFUN([AX_CODE_COVERAGE],[
	dnl Check for --enable-code-coverage

	# allow to override gcov location
	AC_ARG_WITH([gcov],
	  [AS_HELP_STRING([--with-gcov[=GCOV]], [use given GCOV for coverage (GCOV=gcov).])],
	  [_AX_CODE_COVERAGE_GCOV_PROG_WITH=$with_gcov],
	  [_AX_CODE_COVERAGE_GCOV_PROG_WITH=gcov])

	AC_MSG_CHECKING([whether to build with code coverage support])
	AC_ARG_ENABLE([code-coverage],
	  AS_HELP_STRING([--enable-code-coverage],
	  [Whether to enable code coverage support]),,
	  enable_code_coverage=no)

	AM_CONDITIONAL([CODE_COVERAGE_ENABLED], [test "x$enable_code_coverage" = xyes])
	AC_SUBST([CODE_COVERAGE_ENABLED], [$enable_code_coverage])
	AC_MSG_RESULT($enable_code_coverage)

	AS_IF([ test "x$enable_code_coverage" = xyes ], [
		_AX_CODE_COVERAGE_ENABLED
	      ])

	_AX_CODE_COVERAGE_RULES
])

# ===========================================================================
#     https://www.gnu.org/software/autoconf-archive/ax_file_escapes.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_FILE_ESCAPES
#
# DESCRIPTION
#
#   Writes the specified data to the specified file.
#
# LICENSE
#
#   Copyright (c) 2008 Tom Howard <tomhoward@users.sf.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 8

AC_DEFUN([AX_FILE_ESCAPES],[
AX_DOLLAR="\$"
AX_SRB="\\135"
AX_SLB="\\133"
AX_BS="\\\\"
AX_DQ="\""
])

# ===========================================================================
#     https://www.gnu.org/software/autoconf-archive/ax_gnu_autotest.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_GNU_AUTOTEST([testdir = `tests'], [testsuites = `testsuite'],
#                   [atlocal-sources = `'], [gen-package = `yes'],
#                   [force = `no'])
#
# DESCRIPTION
#
#   Sets up one or multiple GNU Autotest test suites [1].
#
#   TL;DR:
#
#     * Write tests/testsuite.at as normal
#     * Add to configure.ac: AX_GNU_AUTOTEST
#     * Add to Makefile.am or Makefile.in in top_srcdir:
#       @AX_GNU_AUTOTEST_DEFAULT@
#     * autoreconf && ./configure && make check
#
#   GNU Autotest is a very powerful testing framework to script executing
#   binaries, observing their output and logging failures, all in the same
#   portable manner as configure itself. But the only help given the
#   developer in setting up the framework is the AC_CONFIG_TESTDIR()
#   command, which leaves several additional steps up to the developer
#   copying examples from the manual:
#
#     * generating the "package.m4" file used in generating the "testsuite"
#     * generating the "testsuite" executable by calling autom4te
#     * adding Makefile rules to keep both "package.m4" and "testsuite"
#       current
#     * figuring out how to do all the above if the Makefile does not reside
#       in the testdir
#
#   This command takes care of all of the above. It is designed to be called
#   multiple times for different testdir directories, to have multiple
#   testsuites scripts per directory and to handle the optional "package.m4"
#   and "atlocal" (re)generation.
#
#   The various actions taken by this command happen in different phases of
#   the build process:
#
#     1) During the autoconf execution, generate the testsuites and any
#        "package.m4" files. So these are already available before configure
#        ran. The reasoning for deviating from the examples in [1] is that
#        these files are distributed and must be placed in the srcdir: it
#        seems cleaner to not generate anything in srcdir during any of the
#        later phases.
#     2) During the config.status execution (following the configure
#        execution), generate "atconfig" and any "atlocal" files in the
#        buildir. The "atconfig" generation is handled by calling
#        AC_CONFIG_TESTDIR() so the developer does not have to do so
#        themselves.
#     3) During the execution of make, several additional rules and file
#        lists are made available via AC_SUBST(). The rules are intended
#        to be called where appropriate (e.g. make check can depend on
#        check-autotest) and the file lists are intended to be added
#        to the appropriate lists (i.e. to DISTCLEANFILES and EXTRA_DIST).
#
#   Description of AX_GNU_AUTOTEST() arguments:
#
#     * testdir: directory-name containing the testsuites. AX_GNU_AUTOTEST()
#       must be called exactly once for each directory containing testsuites.
#       If empty, defaults to "tests".
#     * testsuites: space-separated list of words, where each word is the
#       name of a test suite script optionally followed by a colon and the
#       name of the scripts source file. If the source file is not given,
#       it defaults to the script name suffixed by ".at". So these words
#       are all equivalent: "foo", "foo:" and "foo:foo.at". If the argument
#       is empty, it defaults to "testsuite". The script filenames must not
#       contain any path, but that is allowed for the source filenames.
#     * atlocal-sources: space- or colon-separated list of filenames, which
#       are registered with AC_CONFIG_FILES() as the sources of atlocal.
#       If empty, no atlocal file is generated.
#     * gen-package: boolean ("yes" or "no") indicating whether "package.m4"
#       should be generated. If empty, defaults to "yes".
#     * force: boolean ("yes" or "no") whether to treat errors in arguments
#       as errors and abort (for "no") or whether to ignore any such errors
#       (for "yes"). If empty, defaults to "no".
#
#   All filenames above must be relative. The testdir name is interpreted
#   relative to top_srcdir. All other names are interpreted relative to the
#   testdir. The boolean values are interpreted as "yes" for any non-empty
#   value except "0", "n", "no" and their mixed-case variants.
#
#   Description of Makefile.am / Makefile.in substitutions:
#
#     * AX_GNU_AUTOTEST_RULES: the make rules provided here. Substitute this
#       in a separate line.
#     * AX_GNU_AUTOTEST_DCLEAN: the list of files to be added to
#       DISTCLEANFILES.
#     * AX_GNU_AUTOTEST_DIST: the list of files to be added to EXTRA_DIST.
#     * AX_GNU_AUTOTEST_DEFAULT: includes all other substitutions and uses
#       them in a "default" way.
#
#   All must be used as a substitution (@...@) instead of as a variable
#   ($(...) or ${...}). These substitutions are generated multiple times,
#   once for each directory where an affected Makefile may be located. All
#   substitutions start with the base as given above but may have suffixes
#   for the directories. Assuming this example in configure.ac:
#
#     AX_GNU_AUTOTEST([foo/bar])
#     AX_GNU_AUTOTEST([baz])
#
#   Then the following substitutions are available (where <base> stands for
#   one of the above prefixes):
#
#     * <base>         : for use in top_srcdir/Makefile
#     * <base>_foo     : for use in top_srcdir/foo/Makefile
#     * <base>_foo_bar : for use in top_srcdir/foo/bar/Makefile
#     * <base>_baz     : for use in top_srcdir/baz/Makefile
#
#   The <base> substitutions cover both foo/bar and baz, so none of the
#   other substitutions should be used. Indeed, no Makefiles are needed in
#   the other directories. But if sub-directory Makefiles are used, then
#   both <base>_baz and either of <base>_foo or <base>_foo_bar must be used
#   in their respective Makefiles.
#
#   Description of Makefile targets defined by AX_GNU_AUTOTEST_RULES*:
#
#     * check-autotest: The equivalent of check.
#     * installcheck-autotest: The equivalent of installcheck.
#     * clean-autotest: The equivalent of clean.
#
#   The developer can either define the above targets as dependencies of
#   their appropriate equivalent rule or of their *-local equivalent rule
#   for automake or they can define a rule with a sub-make call as they
#   wish.
#
#   All rules are dependent on like-named rules for each sub-directory and
#   for each testsuite. Only the testsuite rules actually do any work, the
#   rest are just collectors and convenience names. Assuming this example in
#   configure.ac:
#
#     AX_GNU_AUTOTEST([foo], [testsuite bar])
#     AX_GNU_AUTOTEST([baz])
#
#   Then AX_GNU_AUTOTEST_RULES defines these check rules (likewise for
#   installcheck and clean):
#
#     check-autotest: check-autotest-foo check-autotest-baz
#     check-autotest-foo: check-autotest-foo-testsuite check-autotest-foo-bar
#     check-autotest-baz: check-autotest-baz-testsuite
#     check-autotest-foo-testsuite  # Executes foo/testsuite -C foo
#     check-autotest-foo-bar        # Executes foo/bar -C foo
#     check-autotest-baz-testsuite  # Executes baz/testsuite -C baz
#
#   And AX_GNU_AUTOTEST_RULES_baz defines these check rules:
#
#     check-autotest: check-autotest-testsuite
#     check-autotest-testsuite  # Executes testsuite (which is baz/testsuite)
#
#   Note how the rule names only contain the directory and testsuite paths
#   relative to the Makefile location. Also note how each testsuite is
#   executed in its respective testdir.
#
#   In addition to the above, AX_GNU_AUTOTEST_RULES* also contains the rules
#   to keep the testsuites, "package.m4" and "atconfig" updated. The
#   matching rules to keep "atlocal" updated are generated by automake if
#   that is used or are the responsibility of the developer.
#
#   All testsuite executions (except for clean) use variables
#   AX_GNU_AUTOTEST_FLAGS, AX_GNU_AUTOTEST_CHECK_FLAGS,
#   AX_GNU_AUTOTEST_INSTALLCHECK_FLAGS and more path-and-script-specific
#   variants for additional command line options. These variables can be
#   defined by the developer to pass options to the testsuite. In the
#   example above, the rule check-autotest-foo-bar would look like this:
#
#     check-autotest-foo-bar:
#         foo/bar -C foo $(AX_GNU_AUTOTEST_FLAGS)               \
#                        $(AX_GNU_AUTOTEST_CHECK_FLAGS)         \
#                        $(AX_GNU_AUTOTEST_FLAGS_foo)           \
#                        $(AX_GNU_AUTOTEST_CHECK_FLAGS_foo)     \
#                        $(AX_GNU_AUTOTEST_FLAGS_foo_bar)       \
#                        $(AX_GNU_AUTOTEST_CHECK_FLAGS_foo_bar)
#
#   Description of Makefile file lists:
#
#   These lists are intended to be added to DISTCLEANFILES and EXTRA_DIST.
#   The *_DCLEAN list contains all "atconfig" files and the *_DIST list
#   contains all testsuites and "package.m4" files. The lists are again
#   generated per directory: so AX_GNU_AUTOTEST_DCLEAN contains all
#   "atconfig" files while e.g. AX_GNU_AUTOTEST_DIST_foo contains only files
#   below the "foo" directory. These file lists are prevented from becoming
#   Makefile variables by calling AM_SUBST_NOTMAKE(): that way, only the
#   single version used by the Makefile is substituted, not all lists for
#   all other paths as well. So use either like this:
#
#     DISTCLEANFILES = @AX_GNU_AUTOTEST_DCLEAN@
#     EXTRA_DIST = @AX_GNU_AUTOTEST_DIST_foo@
#
#   Or like this:
#
#     AX_GNU_AUTOTEST_DCLEAN_foo = @AX_GNU_AUTOTEST_DCLEAN_foo@
#     AX_GNU_AUTOTEST_DIST_foo = @AX_GNU_AUTOTEST_DIST_foo@
#     DISTCLEANFILES = ${AX_GNU_AUTOTEST_DCLEAN_foo}
#     EXTRA_DIST = ${AX_GNU_AUTOTEST_DIST_foo}
#
#   Description of shorthand default Makefile contents defined by
#   AX_GNU_AUTOTEST_DEFAULT*:
#
#   This shorthand defines the appropriate rules, adds the file lists to the
#   proper variables and makes the new targets dependencies of the standard
#   "check", "installcheck" and "clean" targets. AX_GNU_AUTOTEST_DEFAULT is
#   for example equivalent to:
#
#     @AX_GNU_AUTOTEST_RULES@
#     check: check-autotest
#     installcheck: installcheck-autotest
#     clean: clean-autotest
#     distclean: distclean-autotest
#     distclean-autotest: clean-autotest
#         -rm -f @AX_GNU_AUTOTEST_DCLEAN@
#     .PHONY: distclean-autotest
#     EXTRA_DIST += @AX_GNU_AUTOTEST_DIST@
#
#   Note that this is copied verbatim into the Makefile (after expansion of
#   the contained @...@ substitutions): it does not shadow the default
#   targets as would happen if the same lines were written in a Makefile.am
#   file. And also note the use of the += operator: this will not be
#   compatible with all versions of Make. Finally, the DISTCLEANFILES list
#   is not used because automake only uses that list if it saw the variable
#   in the Makefile.am file: in a substitution, it gets ignored unless the
#   user already used the list.
#
#   Alternative standard GNU test suites not supported here:
#
#     * Automake test suites configured by the TESTS variable [2]
#     * DejaGnu test suites [3,4]
#
#   [1]:
#   <https://www.gnu.org/software/autoconf/manual/html_node/Using-Autotest.html>
#
#   [2]: <https://www.gnu.org/software/automake/manual/html_node/Tests.html>
#
#   [3]: <https://www.gnu.org/software/dejagnu/>
#
#   [4]:
#   <https://www.gnu.org/software/automake/manual/html_node/DejaGnu-Tests.html>
#
# LICENSE
#
#   Copyright (c) 2015 Olaf Mandel <olaf@mandel.name>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.  This file is offered as-is, without any
#   warranty.

#serial 7

# _AX_GNU_AUTOTEST_remove_parent(filename)
# ----------------------------------------
# Remove all sequences of foo/.. from the filename, recursively (so e.g.
# foo/bar/../.. is empty)
# normal input, quoted output!
# replacement: 1st pattern removes in middle of string
#              2nd pattern removes at beginning: string starts with [[ !
#              3rd pattern removes at end of string: string ends in ]] !
#              4th pattern handles complete collapse: string is surrounded
#                  by [[ ... ]] !
m4_define([_AX_GNU_AUTOTEST_remove_parent],
[m4_bmatch([$1], [./\.\.\(/\|$\)],
       [_AX_GNU_AUTOTEST_remove_parent(m4_bpatsubsts([[$1]],
           [/[^/]*\([^.]\|[^.]\.\|[^/]\.\.\)/\.\./], [/],
           [^\(..\)[^/]*\([^.]\|[^.]\.\|[^/]\.\.\)/\.\./], [\1],
           [/[^/]*\([^.]\|[^.]\.\|[^/]\.\.\)/\.\.\(..\)$], [\2],
           [^\(..\)[^/]*\([^.]\|[^.]\.\|[^/]\.\.\)/\.\.\(..\)$], [\1.\3]))],
       [[$1]])dnl
])# _AX_GNU_AUTOTEST_remove_parent

# _AX_GNU_AUTOTEST_canonicalize(filename)
# ---------------------------------------
# Canonicalize filename: see below for replacements
# normal input, quoted output!
# replacement: 1st pattern removes runs of /
#              2nd pattern removes runs of ./ from middle
#              3rd pattern removes ./ from beginning: string starts with [[ !
#              4th pattern removes / and /. from end: string ends in ]] !
m4_define([_AX_GNU_AUTOTEST_canonicalize],
[_AX_GNU_AUTOTEST_remove_parent(dnl
m4_bpatsubsts([[$1]],
              [//+], [/],
              [/\(\./\)+], [/],
              [^\(..\)\./], [\1],
              [/\.?\(..\)$], [\1]))dnl
])# _AX_GNU_AUTOTEST_canonicalize

# _AX_GNU_AUTOTEST_check_filename(filename)
# -----------------------------------------
# Checks and warns if filename contains invalid characters
m4_define([_AX_GNU_AUTOTEST_check_filename],
[m4_bmatch([$1],
           [\[\|\]], [m4_fatal([Overquoted file name '$1'])],
           [,],      [m4_fatal([Comma in file name '$1'])],
           [:],      [m4_fatal([Colon in file name '$1'])],
           ['],      [m4_fatal([Quote in file name '$1'])],
           [ ],      [m4_fatal([Whitespace in file name '$1'])])dnl
])# _AX_GNU_AUTOTEST_check_filename

# _AX_GNU_AUTOTEST_suite_split(suite)
# -----------------------------------
# Convert string [foo:bar] into list [[foo],[bar]] and string [foo] to
# list [[foo],[]]
# Output is quoted
# For the m4_bpatsubst, the string starts and ends with [ ]
m4_define([_AX_GNU_AUTOTEST_suite_split],
[m4_bmatch([$1],
           [:], [m4_dquote(m4_bpatsubst([[$1]], [:.*\(.\)$], [\1]),
                           m4_bpatsubst([[$1]], [^\(.\)[^:]*:], [\1]))],
                [m4_dquote([$1], [])])dnl
])# _AX_GNU_AUTOTEST_suite_split

# _AX_GNU_AUTOTEST_check_suite1(suite, source)
# --------------------------------------------
# Checks both suite and source with _AX_GNU_AUTOTEST_check_filename
m4_define([_AX_GNU_AUTOTEST_check_suite1],
[_AX_GNU_AUTOTEST_check_filename([$1])dnl
_AX_GNU_AUTOTEST_check_filename([$2])dnl
])# _AX_GNU_AUTOTEST_suite_canon1

# _AX_GNU_AUTOTEST_suite_canon(suite, source)
# -------------------------------------------
# Returns a quoted list of canonicalized suite and source
m4_define([_AX_GNU_AUTOTEST_suite_canon],
[m4_dquote(_AX_GNU_AUTOTEST_canonicalize([$1]),
           _AX_GNU_AUTOTEST_canonicalize([$2]))dnl
])# _AX_GNU_AUTOTEST_suite_canon

# _AX_GNU_AUTOTEST_check_suite2(suite)
# ------------------------------------
# Check for and warn about the presence of a slash (path-separator)
m4_define([_AX_GNU_AUTOTEST_check_suite2],
[m4_bmatch([$1],
           [/], [m4_fatal([Path in test suite file name '$1'])])dnl
])# _AX_GNU_AUTOTEST_check_suite2

# _AX_GNU_AUTOTEST_suite_expand(suite, source)
# --------------------------------------------
# Returns a quoted list of default values: suite defaults to [testsuite] and
# source defaults to suite[.at]
m4_define([_AX_GNU_AUTOTEST_suite_expand],
[m4_dquote(m4_ifblank([$1], [[testsuite]], [[$1]]),
           m4_ifblank([$2], [m4_ifblank([$1], [[testsuite.at]], [[$1.at]])],
                            [[$2]]))dnl
])# _AX_GNU_AUTOTEST_suite_expand

# _AX_GNU_AUTOTEST_add_suite(dir, [suite, source], gen_package, force)
# --------------------------------------------------------------------
# Add dir/suite to the _AX_GNU_AUTOTEST_suites variable, warning about
# duplicates unless force is non-blank. And add the source and if
# gen_package is true also package.m4 to _AX_GNU_AUTOTEST_suite_srcs
# Global variables used:
# - _AX_GNU_AUTOTEST_suites
# - _AX_GNU_AUTOTEST_suite_srcs
m4_define([_AX_GNU_AUTOTEST_add_suite],
[m4_set_add([_AX_GNU_AUTOTEST_suites], [$1/]m4_car($2), [],
            [m4_ifblank([$4], [m4_fatal([Multiple mentions of testsuite ']dnl
[$1/]m4_car($2)['])])])dnl
m4_define([_AX_GNU_AUTOTEST_suite_srcs]m4_dquote([$1/]m4_car($2)),
          m4_dquote(m4_unquote(m4_cdr($2))dnl
m4_ifnblank($3, [,[package.m4]])))dnl
])# _AX_GNU_AUTOTEST_add_suite

# _AX_GNU_AUTOTEST_gen_package(file)
# ----------------------------------
# Generate a package.m4 file if out of date wrt/ configure.am
# TODO: what other dependencies to check?
m4_define([_AX_GNU_AUTOTEST_gen_package],
[m4_if(m4_esyscmd_s([test -f '$1' -a ! '$1' -ot ']__file__['; echo $?]), 1,
[m4_errprintn(m4_location[: generating `$1' ]dnl
m4_esyscmd_s([mkdir -p "`dirname '$1'`" && cat >'$1' <<"EOFpackage.m4"
# Signature of the current package.
m4_define([AT_PACKAGE_NAME],
  ]m4_dquote(m4_defn([AC_PACKAGE_NAME]))[)
m4_define([AT_PACKAGE_TARNAME],
  ]m4_dquote(m4_defn([AC_PACKAGE_TARNAME]))[)
m4_define([AT_PACKAGE_VERSION],
  ]m4_dquote(m4_defn([AC_PACKAGE_VERSION]))[)
m4_define([AT_PACKAGE_STRING],
  ]m4_dquote(m4_defn([AC_PACKAGE_STRING]))[)
m4_define([AT_PACKAGE_BUGREPORT],
  ]m4_dquote(m4_defn([AC_PACKAGE_BUGREPORT]))[)
m4_define([AT_PACKAGE_URL],
  ]m4_dquote(m4_defn([AC_PACKAGE_URL]))[)
EOFpackage.m4]))])dnl
])# _AX_GNU_AUTOTEST_gen_package

# _AX_GNU_AUTOTEST_gen_suite(dir, [suite, source], package)
# ---------------------------------------------------------
# Generate a testscript file dir/suite if out of date wrt/ dir/source (or
# dir/package.m4 if package-var is non-zero)
m4_define([_AX_GNU_AUTOTEST_gen_suite],
[m4_pushdef([suite], [$1/]m4_car($2))dnl
m4_pushdef([source], [$1/]m4_argn(2, $2))dnl
m4_if(m4_esyscmd_s([test -f ']m4_defn([suite])[' -a ! ']dnl
m4_defn([suite])[' -ot ']m4_defn([source])[']m4_ifnblank($3,
m4_dquote([ -a ! ']m4_defn([suite])[' -ot '$1/package.m4']))dnl
[; echo $?]), 1,
[m4_errprintn(m4_location[: generating `]m4_defn([suite])[' ]dnl
m4_esyscmd_s([mkdir -p '$1' && autom4te --language=autotest -I '$1' -o ']dnl
m4_defn([suite])[' ']m4_defn([source])[']))])dnl
m4_popdef([suite], [source])dnl
])# _AX_GNU_AUTOTEST_gen_suite

# _AX_GNU_AUTOTEST_dist_suite(dir, [suite, source])
# -------------------------------------------------
# Add dir/suite and dir/source to _AX_GNU_AUTOTEST_dist
# Global variables used:
# - _AX_GNU_AUTOTEST_dist
m4_define([_AX_GNU_AUTOTEST_dist_suite],
[m4_set_add([_AX_GNU_AUTOTEST_dist], [$1/]m4_car($2))dnl
m4_set_add([_AX_GNU_AUTOTEST_dist], [$1/]m4_argn(2, $2))dnl
])# _AX_GNU_AUTOTEST_dist_suite

# _AX_GNU_AUTOTEST_acsubst_shared()
# ---------------------------------
# Generates rules and Makefile snippets shared between all directories
# shared1 is used for silencing builds and included in all RULES,
# shared2 is used in the DEFAULT substitution
m4_define([_AX_GNU_AUTOTEST_acsubst_shared],
[AC_SUBST([_AX_GNU_AUTOTEST_shared1],
[['AX_GNU_AUTOTEST_V_RUN = $(_AX_GNU_AUTOTEST_v_RUN_$(V))
_AX_GNU_AUTOTEST_v_RUN_ = $(_AX_GNU_AUTOTEST_v_RUN_$(AM_DEFAULT_VERBOSITY))
_AX_GNU_AUTOTEST_v_RUN_0 = @echo "  RUN   " $<;
AX_GNU_AUTOTEST_V_quiet_flag = $(_AX_GNU_AUTOTEST_v_quiet_flag_$(V))
_AX_GNU_AUTOTEST_v_quiet_flag_ = ]dnl
[$(_AX_GNU_AUTOTEST_v_quiet_flag_$(AM_DEFAULT_VERBOSITY))
_AX_GNU_AUTOTEST_v_quiet_flag_0 = -q # <- Note: trailing whitespace']])dnl
AM_SUBST_NOTMAKE([_AX_GNU_AUTOTEST_shared1])dnl
AC_SUBST([_AX_GNU_AUTOTEST_shared2],
[['check: check-autotest
installcheck: installcheck-autotest
clean: clean-autotest
distclean: distclean-autotest
.PHONY: distclean-autotest
distclean-autotest: clean-autotest']])dnl
AM_SUBST_NOTMAKE([_AX_GNU_AUTOTEST_shared2])dnl
])# _AX_GNU_AUTOTEST_acsubst_shared

# _AX_GNU_AUTOTEST_cleanname(char, name)
# --------------------------------------
# Output name with all non-alphanumeric characters replaced with char
# Output is quoted
# For the m4_bpatsubsts the string starts and ends in [[ ]] and
#   the repetition catches all possible sequences of non-alnum chars
m4_define([_AX_GNU_AUTOTEST_cleanname],
[m4_bpatsubsts([[$2]], [\(..\)[^0-9A-Za-z$1]\(..\)], [\1$1\2],
                       [\(..\)[^0-9A-Za-z$1]\(..\)], [\1$1\2],
                       [\(..\)[^0-9A-Za-z$1]\(..\)], [\1$1\2],
                       [\(..\)[^0-9A-Za-z$1]\(..\)], [\1$1\2],
                       [\(..\)[^0-9A-Za-z$1]\(..\)], [\1$1\2])dnl
])# _AX_GNU_AUTOTEST_cleanname

# _AX_GNU_AUTOTEST_substr(str, start, [len])
# ------------------------------------------
# Like m4_substr(), but with quoted output
# For m4_bpatsubst the string starts and ends in [ ]
# TODO: RE repetition does not work, so need to use loops... Why?
# TODO: What about out-of-range start or len
m4_define([_AX_GNU_AUTOTEST_substr],
[m4_pushdef([i])dnl
m4_if($#, 2, [m4_bpatsubst([[$1]], [^\(.\)]m4_if(m4_eval([($2) > 0]), [0],,
                                   [m4_for([i], 0, m4_eval([($2)-1]),,
                                   [[.]])])[\(.*\)], [\1\2])],
             [m4_bpatsubst([[$1]], [^\(.\)]m4_if(m4_eval([($2) > 0]), [0],,
                                   [m4_for([i], 0, m4_eval([($2)-1]),,
                                   [[.]])])[\(]m4_if(m4_eval([($3) > 0]), [0],,
                                   [m4_for([i], 0, m4_eval([($3)-1]),,
                                   [[.]])])[\).*\(.\)], [\1\2\3])])dnl
m4_popdef([i])dnl
])# _AX_GNU_AUTOTEST_substr

# _AX_GNU_AUTOTEST_list_prependc(prefix, arg1, ...)
# -------------------------------------------------
# Returns unquoted list of ,prefixarg1,prefixarg2, ...
# Output starts with a comma if at least one arg
m4_define([_AX_GNU_AUTOTEST_list_prependc],
[m4_pushdef([i])dnl
m4_foreach([i], m4_cdr($@),
           [,[$1]m4_defn([i])])dnl
m4_popdef([i])dnl
])# _AX_GNU_AUTOTEST_list_prependc

# _AX_GNU_AUTOTEST_list_appendc(postfix, arg1, ...)
# -------------------------------------------------
# Returns unquoted list of ,arg1postfix,arg2postfix, ...
# Output starts with a comma if at least one arg
m4_define([_AX_GNU_AUTOTEST_list_appendc],
[m4_pushdef([i])dnl
m4_foreach([i], m4_cdr($@),
           [,m4_defn([i])[$1]])dnl
m4_popdef([i])dnl
])# _AX_GNU_AUTOTEST_list_appendc

# _AX_GNU_AUTOTEST_filter_listc(prefix, arg1, ...)
# ------------------------------------------------
# Returns unquoted list of all args starting with prefix, but the prefix is
# stripped in the output. Output starts with a comma if at least one arg
m4_define([_AX_GNU_AUTOTEST_filter_listc],
[m4_pushdef([n], m4_len([$1]))dnl
m4_pushdef([i])dnl
m4_foreach([i], m4_cdr($@),
           [m4_if([$1], _AX_GNU_AUTOTEST_substr(m4_defn([i]), 0, n),
                  [,_AX_GNU_AUTOTEST_substr(m4_defn([i]), n)])])dnl
m4_popdef([n], [i])dnl
])# _AX_GNU_AUTOTEST_filter_listc

# _AX_GNU_AUTOTEST_filterout_listc(rx, arg1, ...)
# -----------------------------------------------
# Returns unquoted list of all args not matching regular expression rx
# The arguments are not modified (unlike filter_listc). Output starts with
# a comma if at least one arg
m4_define([_AX_GNU_AUTOTEST_filterout_listc],
[m4_pushdef([i])dnl
m4_foreach([i], m4_cdr($@),
           [m4_bmatch(m4_defn([i]), [$1], [], [,m4_defn([i])])])dnl
m4_popdef([i])dnl
])# _AX_GNU_AUTOTEST_filterout_listc

# _AX_GNU_AUTOTEST_filterpref_listc(prefix, arg1, ...)
# ----------------------------------------------------
# Returns unquoted list of all args that do not start with any of the other
# args followed by the prefix. Output starts with a comma if at least one
# arg. Example:
# filterpref([/], [foo], [foo/bar], [baz/bar])
# => ,[foo],[baz/baz]
# Uses a set variable _AX_GNU_AUTOTEST_filterpref_var, which interferes with
# other variables of the same name elsewhere (pushdef / popdef do not work
# fully for sets).
m4_define([_AX_GNU_AUTOTEST_filterpref_listc],
[m4_pushdef([_AX_GNU_AUTOTEST_filterpref_var])dnl
m4_set_delete([_AX_GNU_AUTOTEST_filterpref_var])dnl
m4_if([$#], [1], [], [m4_set_add_all([_AX_GNU_AUTOTEST_filterpref_var],
                                     m4_unquote(m4_cdr($@)))])dnl
m4_pushdef([i])dnl
m4_pushdef([j])dnl
m4_pushdef([m], m4_len([$1]))dnl
m4_pushdef([n])dnl
m4_foreach([i], m4_cdr($@),
           [m4_define([n], m4_eval(m4_defn([m]) + m4_len(m4_defn([i]))))dnl
m4_set_foreach([_AX_GNU_AUTOTEST_filterpref_var], [j],
               [m4_if(m4_defn([i])[$1],
                      _AX_GNU_AUTOTEST_substr(m4_defn([j]), 0, n),
                      [m4_set_remove([_AX_GNU_AUTOTEST_filterpref_var],
                                     m4_defn([j]))])])])dnl
m4_set_listc([_AX_GNU_AUTOTEST_filterpref_var])dnl
m4_popdef([_AX_GNU_AUTOTEST_filterpref_var], [i], [j], [m], [n])dnl
])# _AX_GNU_AUTOTEST_filterpref_listc

# _AX_GNU_AUTOTEST_rules_flags(dirsuite, target)
# ----------------------------------------------
# Outputs the list of flag variables for the Makefile rules, specific to
# the suite / dir and target
# Recurses into all parent-directories (parent-first)
# For m4_bpatsubsts the string starts and ends in [[ ]]
m4_define([_AX_GNU_AUTOTEST_rules_flags],
[m4_pushdef([name], _AX_GNU_AUTOTEST_cleanname([_], [$1]))dnl
m4_bmatch([$1], [^\.?$],
                 [[ $(AX_GNU_AUTOTEST_FLAGS) $(AX_GNU_AUTOTEST_$2_FLAGS)]],
                 [_AX_GNU_AUTOTEST_rules_flags(m4_bpatsubsts([[$1]],
                                               [^\(..\)[^/]*\(..\)$], [\1\2],
                                               [/[^/]*\(..\)$], [\1]),
                                               [$2])dnl
[ $(AX_GNU_AUTOTEST_FLAGS_]m4_defn([name])[) $(AX_GNU_AUTOTEST_$2_FLAGS_]dnl
m4_defn([name])[)]])dnl
m4_popdef([name])dnl
])# _AX_GNU_AUTOTEST_rules_flags

# _AX_GNU_AUTOTEST_acsubst_rules_suite_deps(suite, dep1, ...)
# -----------------------------------------------------------
# Generates the three rules for one suite, output as string
# The suite and dependencies are already relative to the source-dir.
# For the m4_bpatsubst, the string starts and ends with [ ]
# The two quotes ('') in AM_V_GEN obviate the need for m4_pattern_allow
m4_define([_AX_GNU_AUTOTEST_acsubst_rules_suite_deps],
[m4_pushdef([name], _AX_GNU_AUTOTEST_cleanname([-], [$1]))dnl
m4_pushdef([atconf], [atconfig])dnl
m4_bmatch([$1],
          [/], [m4_define([atconf], m4_bpatsubst([[$1]], [/[^/]*\(.\)$],
                                                         [/atconfig\1]))])dnl
m4_pushdef([cdir])dnl
m4_bmatch([$1],
          [/], [m4_define([cdir], [ -C ]m4_bpatsubst([[$1]], [/[^/]*\(.\)$],
                                                             [\1]))])dnl
m4_dquote([$(srcdir)/$1: $(top_srcdir)/]__file__[]dnl
m4_mapall([[ $(srcdir)/]m4_quote], m4_cdr($@))[
	$(A''M_V_GEN)cd $(top_srcdir) && $(AUTOCONF) -f
]m4_defn([atconf])[:
	$(A''M_V_GEN)cd $(top_builddir) && $(SHELL) ./config.status ]dnl
$(AX_GNU_AUTOTEST_V_quiet_flag)[$][@
check-autotest-]m4_defn([name])[: $(srcdir)/$1 ]m4_defn([atconf])[
	$(AX_GNU_AUTOTEST_V_RUN)$(SHELL) $(srcdir)/$1]m4_defn([cdir])dnl
_AX_GNU_AUTOTEST_rules_flags([$1], [CHECK])[
installcheck-autotest-]m4_defn([name])[: $(srcdir)/$1 ]m4_defn([atconf])[
	$(AX_GNU_AUTOTEST_V_RUN)$(SHELL) $(srcdir)/$1]m4_defn([cdir])dnl
[ AUTOTEST_PATH=$(DESTDIR)$(bindir)]dnl
_AX_GNU_AUTOTEST_rules_flags([$1], [INSTALLCHECK])[
clean-autotest-]m4_defn([name])[: $(srcdir)/$1
	-$(SHELL) $(srcdir)/$1]m4_defn([cdir])[ -c
])dnl
m4_popdef([name], [atconf], [cdir])dnl
])# _AX_GNU_AUTOTEST_acsubst_rules_suite_deps

# _AX_GNU_AUTOTEST_acsubst_rules_suite(dir, suite)
# ------------------------------------------------
# Generates the three rules for one suite, output as string
# The suite is supplied still containing the dir prefix.
# Global variables used:
# - _AX_GNU_AUTOTEST_suite_srcs
m4_define([_AX_GNU_AUTOTEST_acsubst_rules_suite],
[m4_pushdef([suite], [$2])dnl
m4_ifnblank([$1], [m4_define([suite], m4_unquote(m4_cdr(dnl
_AX_GNU_AUTOTEST_filter_listc([$1/], [$2]))))])dnl
m4_pushdef([sdir])dnl
m4_bmatch([$2], [/], [m4_define([sdir],
                      m4_bpatsubst([[$2]], [/[^/]*\(.\)$], [\1]))])dnl
m4_pushdef([deps], m4_dquote(,
                   m4_unquote(m4_defn([_AX_GNU_AUTOTEST_suite_srcs[$2]]))))dnl
m4_ifnblank(m4_defn([sdir]), [m4_define([deps], m4_dquote(dnl
_AX_GNU_AUTOTEST_list_prependc(m4_defn([sdir])[/]deps)))])dnl
m4_ifnblank([$1], [m4_define([deps],
                   m4_dquote(_AX_GNU_AUTOTEST_filter_listc([$1/]deps)))])dnl
_AX_GNU_AUTOTEST_acsubst_rules_suite_deps(m4_defn([suite])deps)dnl
m4_popdef([deps], [sdir], [suite])dnl
])# _AX_GNU_AUTOTEST_acsubst_rules_suite

# _AX_GNU_AUTOTEST_acsubst_rules_dir(base, dir)
# ---------------------------------------------
# Generates the dependency rules for one directory relative to base, output
# as string
# For the m4_bpatsubst, the string starts and ends with [ ]
# Global variables used:
# - _AX_GNU_AUTOTEST_suites
# - _AX_GNU_AUTOTEST_testdirs
m4_define([_AX_GNU_AUTOTEST_acsubst_rules_dir],
[m4_pushdef([name])dnl
m4_ifnblank([$2],
            [m4_define([name], [-]_AX_GNU_AUTOTEST_cleanname([-], [$2]))])dnl
m4_pushdef([suites], m4_dquote(m4_set_listc([_AX_GNU_AUTOTEST_suites])))dnl
m4_ifnblank([$1], [m4_define([suites], m4_dquote(dnl
_AX_GNU_AUTOTEST_filter_listc([$1/]suites)))])dnl
m4_ifblank([$2], [m4_define([suites], m4_dquote(dnl
_AX_GNU_AUTOTEST_filterout_listc([/]suites)))],
                 [m4_define([suites], m4_dquote(dnl
_AX_GNU_AUTOTEST_list_prependc([$2/]dnl
_AX_GNU_AUTOTEST_filterout_listc([/]dnl
_AX_GNU_AUTOTEST_filter_listc([$2/]suites)))))])dnl
m4_pushdef([testdirs], m4_dquote(m4_set_listc(dnl
[_AX_GNU_AUTOTEST_testdirs])))dnl
m4_ifnblank([$1], [m4_define([testdirs], m4_dquote(dnl
_AX_GNU_AUTOTEST_filter_listc([$1/]testdirs)))])dnl
m4_ifblank([$2], [m4_define([testdirs], m4_dquote(dnl
_AX_GNU_AUTOTEST_filterpref_listc([/]testdirs)))],
                 [m4_define([testdirs], m4_dquote(dnl
_AX_GNU_AUTOTEST_list_prependc([$2/]dnl
_AX_GNU_AUTOTEST_filterpref_listc([/]dnl
_AX_GNU_AUTOTEST_filter_listc([$2/]testdirs)))))])dnl
m4_pushdef([deps], m4_quote(m4_cdr(testdirs[]suites)))dnl
m4_define([deps], m4_dquote(m4_mapall_sep(dnl
[[-autotest-]m4_curry([_AX_GNU_AUTOTEST_cleanname], [-])], [,],
m4_defn([deps]))))dnl
m4_dquote([check-autotest]m4_defn([name])[:]m4_mapall([[ check]m4_quote],
                                                      m4_defn([deps]))[
installcheck-autotest]m4_defn([name])[:]m4_mapall([[ installcheck]m4_quote],
                                                  m4_defn([deps]))[
clean-autotest]m4_defn([name])[:]m4_mapall([[ clean]m4_quote],
                                           m4_defn([deps]))[
])dnl
m4_popdef([deps], [name], [suites], [testdirs])dnl
])# _AX_GNU_AUTOTEST_acsubst_rules_dir

# _AX_GNU_AUTOTEST_acsubst_rules_phony(element)
# ---------------------------------------------
# Generates the names of the three targets for one element as string
m4_define([_AX_GNU_AUTOTEST_acsubst_rules_phony],
[m4_pushdef([name])dnl
m4_ifnblank([$1], [m4_define([name],
                             _AX_GNU_AUTOTEST_cleanname([-], [-$1]))])dnl
m4_dquote([ check-autotest]m4_defn([name])dnl
[ installcheck-autotest]m4_defn([name])dnl
[ clean-autotest]m4_defn([name]))dnl
m4_popdef([name])dnl
])# _AX_GNU_AUTOTEST_acsubst_rules_phony

# _AX_GNU_AUTOTEST_acsubst_rules_one(name, dir)
# ---------------------------------------------
# AC_SUBSTs one variable called "name" to contain the rules for all suites
# in or below dir
# Global variables used:
# - _AX_GNU_AUTOTEST_suites
# - _AX_GNU_AUTOTEST_testdirs
m4_define([_AX_GNU_AUTOTEST_acsubst_rules_one],
[m4_pushdef([suites])dnl
m4_ifblank([$2], [m4_define([suites], m4_dquote(dnl
m4_set_listc([_AX_GNU_AUTOTEST_suites])))],
                 [m4_define([suites], m4_dquote(dnl
_AX_GNU_AUTOTEST_list_prependc([$2/]dnl
_AX_GNU_AUTOTEST_filter_listc([$2/]dnl
m4_set_listc([_AX_GNU_AUTOTEST_suites])))))])dnl
m4_pushdef([testdirs])dnl
m4_ifblank([$2], [m4_define([testdirs], m4_dquote([],
                            m4_set_listc([_AX_GNU_AUTOTEST_testdirs])))],
                 [m4_define([testdirs], m4_dquote([],
                            _AX_GNU_AUTOTEST_filter_listc([$2/]dnl
m4_set_listc([_AX_GNU_AUTOTEST_testdirs]))))])dnl
AC_SUBST([$1],
[["${_AX_GNU_AUTOTEST_shared1}"'
]]m4_map_args([m4_curry([_AX_GNU_AUTOTEST_acsubst_rules_suite],
                       [$2])]suites)dnl
m4_map_args([m4_curry([_AX_GNU_AUTOTEST_acsubst_rules_dir], [$2])]testdirs)dnl
[[.PHONY:]]m4_map_args_sep([_AX_GNU_AUTOTEST_acsubst_rules_phony(], [)], [\
]testdirs[]suites)[[']])dnl
AM_SUBST_NOTMAKE([$1])dnl
m4_popdef([suites], [testdirs])dnl
])# _AX_GNU_AUTOTEST_acsubst_rules_one

# _AX_GNU_AUTOTEST_acsubst_rules(dir)
# -----------------------------------
# AC_SUBSTs the rules variable for dir and recurses for all parent-dirs
# Recurses into all parent-directories
# For m4_bpatsubsts the string starts and ends in [[ ]]
m4_define([_AX_GNU_AUTOTEST_acsubst_rules],
[m4_bmatch([$1], [^\.?$],
                 [_AX_GNU_AUTOTEST_acsubst_rules_one([AX_GNU_AUTOTEST_RULES],
                                                     [])],
                 [_AX_GNU_AUTOTEST_acsubst_rules_one(dnl
[AX_GNU_AUTOTEST_RULES_]_AX_GNU_AUTOTEST_cleanname([_], [$1]), [$1])dnl
_AX_GNU_AUTOTEST_acsubst_rules(m4_bpatsubsts([[$1]], [^\(..\)[^/]*\(..\)$],
                               [\1\2], [/[^/]*\(..\)$], [\1]))])dnl
])# _AX_GNU_AUTOTEST_acsubst_rules

# _AX_GNU_AUTOTEST_acsubst_list(name, arg1, ...)
# ----------------------------------------------
# AC_SUBSTs the name variable to contain all arg1, ...
m4_define([_AX_GNU_AUTOTEST_acsubst_list],
[AC_SUBST([$1], [[']]m4_dquote(m4_mapall_sep([m4_quote], [[\
 ]], m4_dquote(m4_dquote_elt(m4_unquote(m4_cdr($@))))))[[']])dnl
AM_SUBST_NOTMAKE([$1])dnl
])# _AX_GNU_AUTOTEST_acsubst_list

# _AX_GNU_AUTOTEST_acsubst_dclean(dir)
# ------------------------------------
# AC_SUBSTs the dclean variable for dir and recurses for all parent-dirs
# Global variables used:
# - _AX_GNU_AUTOTEST_testdirs
# Recurses into all parent-directories
# For m4_bpatsubsts the string starts and ends in [[ ]]
m4_define([_AX_GNU_AUTOTEST_acsubst_dclean],
[m4_bmatch([$1], [^\.?$],
                 [_AX_GNU_AUTOTEST_acsubst_list([AX_GNU_AUTOTEST_DCLEAN]dnl
_AX_GNU_AUTOTEST_list_appendc([/atconfig]dnl
m4_set_listc([_AX_GNU_AUTOTEST_testdirs])))],
                 [_AX_GNU_AUTOTEST_acsubst_list(dnl
[AX_GNU_AUTOTEST_DCLEAN_]_AX_GNU_AUTOTEST_cleanname([_], [$1])dnl
_AX_GNU_AUTOTEST_filter_listc([$1/]dnl
_AX_GNU_AUTOTEST_list_appendc([/atconfig]dnl
m4_set_listc([_AX_GNU_AUTOTEST_testdirs]))))dnl
_AX_GNU_AUTOTEST_acsubst_dclean(m4_bpatsubsts([[$1]], [^\(..\)[^/]*\(..\)$],
                                [\1\2], [/[^/]*\(..\)$], [\1]))])dnl
])# _AX_GNU_AUTOTEST_acsubst_dclean

# _AX_GNU_AUTOTEST_acsubst_dist(dir)
# ----------------------------------
# AC_SUBSTs the dist variable for dir and recurses for all parent-dirs
# Global variables used:
# - _AX_GNU_AUTOTEST_dist
# Recurses into all parent-directories
# For m4_bpatsubsts the string starts and ends in [[ ]]
m4_define([_AX_GNU_AUTOTEST_acsubst_dist],
[m4_bmatch([$1], [^\.?$],
                 [_AX_GNU_AUTOTEST_acsubst_list([AX_GNU_AUTOTEST_DIST]dnl
m4_set_listc([_AX_GNU_AUTOTEST_dist]))],
                 [_AX_GNU_AUTOTEST_acsubst_list(dnl
[AX_GNU_AUTOTEST_DIST_]_AX_GNU_AUTOTEST_cleanname([_], [$1])dnl
_AX_GNU_AUTOTEST_filter_listc([$1/]m4_set_listc([_AX_GNU_AUTOTEST_dist])))dnl
_AX_GNU_AUTOTEST_acsubst_dist(m4_bpatsubsts([[$1]], [^\(..\)[^/]*\(..\)$],
                              [\1\2], [/[^/]*\(..\)$], [\1]))])dnl
])# _AX_GNU_AUTOTEST_acsubst_dist

# _AX_GNU_AUTOTEST_acsubst_default(dir)
# -------------------------------------
# AC_SUBSTs the rules of the "default" use-case  for dir and recurses for
# all parent-dirs
# Recurses into all parent-directories
# For m4_bpatsubsts the string starts and ends in [[ ]]
m4_define([_AX_GNU_AUTOTEST_acsubst_default],
[m4_pushdef([name])dnl
m4_bmatch([$1], [^\.?$], [],
          [m4_define([name], [_]_AX_GNU_AUTOTEST_cleanname([_], [$1]))])dnl
AC_SUBST([AX_GNU_AUTOTEST_DEFAULT]m4_defn([name]),
[["${AX_GNU_AUTOTEST_RULES]m4_defn([name])[}
${_AX_GNU_AUTOTEST_shared2}"'
	-rm -f '"${AX_GNU_AUTOTEST_DCLEAN]m4_defn([name])[}"'
EXTRA_DIST += '"${AX_GNU_AUTOTEST_DIST]m4_defn([name])[}"]])dnl
AM_SUBST_NOTMAKE([AX_GNU_AUTOTEST_DEFAULT]m4_defn([name]))dnl
m4_popdef([name])dnl
m4_bmatch([$1], [^\.?$], [],
          [_AX_GNU_AUTOTEST_acsubst_default(m4_bpatsubsts([[$1]],
               [^\(..\)[^/]*\(..\)$], [\1\2], [/[^/]*\(..\)$], [\1]))])dnl
])# _AX_GNU_AUTOTEST_acsubst_default

# AX_GNU_AUTOTEST([testdir = `tests'], [testsuites = `testsuite'],
#                 [atlocal-sources = `'], [gen-package = `yes'],
#                 [force = `no'])
# ----------------------------------------------------------------
# Global variables used:
# - _AX_GNU_AUTOTEST_testdirs
# - _AX_GNU_AUTOTEST_suites
# - _AX_GNU_AUTOTEST_suite_srcs
# - _AX_GNU_AUTOTEST_dist
AC_DEFUN([AX_GNU_AUTOTEST],
[dnl Check command arguments
dnl Check $5: force
m4_pushdef([force], m4_normalize([$5]))dnl
m4_bmatch(m4_defn([force]), [^\([Nn][Oo]?\|0\)$], [m4_define([force], [])])dnl
m4_ifnblank(m4_defn([force]), [m4_define([force], 1)])dnl
dnl
dnl Check $1: testdir
m4_pushdef([testdir], m4_normalize([$1]))dnl
m4_ifblank(m4_defn([testdir]), [m4_define([testdir], [tests])])dnl
m4_ifblank(force, [_AX_GNU_AUTOTEST_check_filename(m4_defn([testdir]))])dnl
m4_define([testdir], _AX_GNU_AUTOTEST_canonicalize(m4_defn([testdir])))dnl
m4_set_add([_AX_GNU_AUTOTEST_testdirs], m4_defn([testdir]), [],
           [m4_ifblank(force,
    [m4_fatal([Already configured directory ']m4_defn([testdir])['])])])dnl
dnl
dnl Check $4: gen-package
m4_pushdef([gen_package], m4_normalize([$4]))dnl
m4_ifblank(m4_defn([gen_package]), [m4_define([gen_package], [yes])])dnl
m4_bmatch(m4_defn([gen_package]),
          [^\([Nn][Oo]?\|0\)$], [m4_define([gen_package], [])])dnl
m4_ifnblank(m4_defn([gen_package]), [m4_define([gen_package], 1)])dnl
dnl
dnl Check $2: testsuites
m4_pushdef([testsuites], m4_normalize([$2]))dnl
m4_ifblank(m4_defn([testsuites]), [m4_define([testsuites], [testsuite])])dnl
m4_define([testsuites], m4_dquote(m4_map_args_w(m4_defn([testsuites]),
                        [_AX_GNU_AUTOTEST_suite_split(], [)], [,])))dnl
m4_ifblank(force, [m4_map([_AX_GNU_AUTOTEST_check_suite1],
                          m4_defn([testsuites]))])dnl
m4_define([testsuites], m4_dquote(m4_map_sep([_AX_GNU_AUTOTEST_suite_canon],
                                             [,], m4_defn([testsuites]))))dnl
m4_ifblank(force, [m4_map([_AX_GNU_AUTOTEST_check_suite2],
                          m4_defn([testsuites]))])dnl
m4_define([testsuites], m4_dquote(m4_map_sep([_AX_GNU_AUTOTEST_suite_expand],
                                             [,], m4_defn([testsuites]))))dnl
m4_map_args_sep([_AX_GNU_AUTOTEST_add_suite(]m4_quote(m4_defn([testdir]))[,],
                [,]m4_defn([gen_package])[,]m4_defn([force])[)], [],
                testsuites)dnl
dnl
dnl Check $3: atlocal-sources
m4_pushdef([atlocal_sources], m4_normalize(m4_bpatsubst([[$3]], [:], [ ])))dnl
m4_define([atlocal_sources], m4_split(m4_defn([atlocal_sources]), [ ]))dnl
m4_ifnblank(m4_defn([atlocal_sources]), [m4_define([atlocal_sources],
    m4_dquote(m4_map_args_sep([_AX_GNU_AUTOTEST_canonicalize(],
                              [)], [,], atlocal_sources)))])dnl
m4_ifblank(force, [m4_map_args([_AX_GNU_AUTOTEST_check_filename],
                               atlocal_sources)])dnl
dnl
dnl Phase 1
m4_ifnblank(gen_package,
[_AX_GNU_AUTOTEST_gen_package(m4_defn([testdir])[/package.m4])dnl
m4_set_add([_AX_GNU_AUTOTEST_dist], m4_defn([testdir])[/package.m4])dnl
])dnl
m4_map_args_sep([_AX_GNU_AUTOTEST_gen_suite([]m4_defn([testdir])[],],
                [,]gen_package[)], [], testsuites)dnl
m4_map_args_sep([_AX_GNU_AUTOTEST_dist_suite([]m4_defn([testdir])[],],
                [)], [], testsuites)dnl
dnl
dnl Phase 2
dnl The following commands fail for quotes in testdir
AC_CONFIG_TESTDIR(m4_dquote(m4_defn([testdir])))dnl
m4_ifnblank(m4_defn([atlocal_sources]), [AC_CONFIG_FILES(dnl
m4_defn([testdir])[/atlocal:]m4_map_args_sep(m4_defn([testdir])[/],
                                             [], [:], atlocal_sources))])dnl
dnl
dnl Phase 3
_AX_GNU_AUTOTEST_acsubst_shared()dnl
_AX_GNU_AUTOTEST_acsubst_rules(m4_defn([testdir]))dnl
_AX_GNU_AUTOTEST_acsubst_dclean(m4_defn([testdir]))dnl
_AX_GNU_AUTOTEST_acsubst_dist(m4_defn([testdir]))dnl
_AX_GNU_AUTOTEST_acsubst_default(m4_defn([testdir]))dnl
dnl
m4_popdef([testdir], [testsuites], [atlocal_sources], [gen_package],
          [force])dnl
])# AX_GNU_AUTOTEST

# ===========================================================================
#       https://www.gnu.org/software/autoconf-archive/ax_need_awk.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_NEED_AWK
#
# DESCRIPTION
#
#   Check if an awk implementation is available. Bail-out if not found.
#
#   This work is heavily based upon testawk.sh script by Heiner Steven. You
#   should find his script (and related works) at
#   <http://www.shelldorado.com/articles/awkcompat.html>. Thanks to
#   Alessandro Massignan for his suggestions and extensive nawk tests on
#   FreeBSD.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 9

AC_DEFUN([AX_NEED_AWK],[
  AC_REQUIRE([AC_PROG_AWK])

  AS_IF([test "x$AWK" = "x"],[
    AC_MSG_ERROR([cannot find awk, bailing out])
  ])
])

# ===========================================================================
#    https://www.gnu.org/software/autoconf-archive/ax_try_awk_expout.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_TRY_AWK_EXPOUT(NAME,TEST-INPUT,TEST-BODY,EXPECTED-OUTPUT,[ACTION-IF-SUCCESS],[ACTION-IF-FAILURE])
#
# DESCRIPTION
#
#   Run a test using the awk program found on AWK variable. The test being
#   run has TEST-BODY as body and is feeded with TEST-INPUT. Check if the
#   test gives the expected output. If successful execute ACTION-IF-SUCCESS
#   otherwise ACTION-IF-FAILURE.
#
#   This work is heavily based upon testawk.sh script by Heiner Steven. You
#   should find his script (and related works) at
#   <http://www.shelldorado.com/articles/awkcompat.html>. Thanks to
#   Alessandro Massignan for his suggestions and extensive nawk tests on
#   FreeBSD.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 9

AC_DEFUN([AX_TRY_AWK_EXPOUT], [
  AC_REQUIRE([AX_NEED_AWK])

  AC_MSG_CHECKING([if $AWK supports $1])

  cat <<EOF > conftest.out
$2
EOF

  ax_try_awk_output=`$AWK '{ [$3] ; }' conftest.out 2> /dev/null`
  ax_try_awk_result=$?

  rm -f conftest.out

  AS_IF([test $ax_try_awk_result -eq 0],[
    AS_IF([test "X$ax_try_awk_output" = "X[$4]"],[
        AC_MSG_RESULT([yes])
        $5
    ],[
        AC_MSG_RESULT([no])
        $6
    ])
  ],[
    AC_MSG_RESULT([no])
    $6
  ])
])

# Copyright (C) 2002-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_AUTOMAKE_VERSION(VERSION)
# ----------------------------
# Automake X.Y traces this macro to ensure aclocal.m4 has been
# generated from the m4 files accompanying Automake X.Y.
# (This private macro should not be called outside this file.)
AC_DEFUN([AM_AUTOMAKE_VERSION],
[am__api_version='1.16'
dnl Some users find AM_AUTOMAKE_VERSION and mistake it for a way to
dnl require some minimum version.  Point them to the right macro.
m4_if([$1], [1.16.1], [],
      [AC_FATAL([Do not call $0, use AM_INIT_AUTOMAKE([$1]).])])dnl
])

# _AM_AUTOCONF_VERSION(VERSION)
# -----------------------------
# aclocal traces this macro to find the Autoconf version.
# This is a private macro too.  Using m4_define simplifies
# the logic in aclocal, which can simply ignore this definition.
m4_define([_AM_AUTOCONF_VERSION], [])

# AM_SET_CURRENT_AUTOMAKE_VERSION
# -------------------------------
# Call AM_AUTOMAKE_VERSION and AM_AUTOMAKE_VERSION so they can be traced.
# This function is AC_REQUIREd by AM_INIT_AUTOMAKE.
AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
[AM_AUTOMAKE_VERSION([1.16.1])dnl
m4_ifndef([AC_AUTOCONF_VERSION],
  [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
_AM_AUTOCONF_VERSION(m4_defn([AC_AUTOCONF_VERSION]))])

# AM_AUX_DIR_EXPAND                                         -*- Autoconf -*-

# Copyright (C) 2001-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# For projects using AC_CONFIG_AUX_DIR([foo]), Autoconf sets
# $ac_aux_dir to '$srcdir/foo'.  In other projects, it is set to
# '$srcdir', '$srcdir/..', or '$srcdir/../..'.
#
# Of course, Automake must honor this variable whenever it calls a
# tool from the auxiliary directory.  The problem is that $srcdir (and
# therefore $ac_aux_dir as well) can be either absolute or relative,
# depending on how configure is run.  This is pretty annoying, since
# it makes $ac_aux_dir quite unusable in subdirectories: in the top
# source directory, any form will work fine, but in subdirectories a
# relative path needs to be adjusted first.
#
# $ac_aux_dir/missing
#    fails when called from a subdirectory if $ac_aux_dir is relative
# $top_srcdir/$ac_aux_dir/missing
#    fails if $ac_aux_dir is absolute,
#    fails when called from a subdirectory in a VPATH build with
#          a relative $ac_aux_dir
#
# The reason of the latter failure is that $top_srcdir and $ac_aux_dir
# are both prefixed by $srcdir.  In an in-source build this is usually
# harmless because $srcdir is '.', but things will broke when you
# start a VPATH build or use an absolute $srcdir.
#
# So we could use something similar to $top_srcdir/$ac_aux_dir/missing,
# iff we strip the leading $srcdir from $ac_aux_dir.  That would be:
#   am_aux_dir='\$(top_srcdir)/'`expr "$ac_aux_dir" : "$srcdir//*\(.*\)"`
# and then we would define $MISSING as
#   MISSING="\${SHELL} $am_aux_dir/missing"
# This will work as long as MISSING is not called from configure, because
# unfortunately $(top_srcdir) has no meaning in configure.
# However there are other variables, like CC, which are often used in
# configure, and could therefore not use this "fixed" $ac_aux_dir.
#
# Another solution, used here, is to always expand $ac_aux_dir to an
# absolute PATH.  The drawback is that using absolute paths prevent a
# configured tree to be moved without reconfiguration.

AC_DEFUN([AM_AUX_DIR_EXPAND],
[AC_REQUIRE([AC_CONFIG_AUX_DIR_DEFAULT])dnl
# Expand $ac_aux_dir to an absolute path.
am_aux_dir=`cd "$ac_aux_dir" && pwd`
])

# AM_CONDITIONAL                                            -*- Autoconf -*-

# Copyright (C) 1997-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_CONDITIONAL(NAME, SHELL-CONDITION)
# -------------------------------------
# Define a conditional.
AC_DEFUN([AM_CONDITIONAL],
[AC_PREREQ([2.52])dnl
 m4_if([$1], [TRUE],  [AC_FATAL([$0: invalid condition: $1])],
       [$1], [FALSE], [AC_FATAL([$0: invalid condition: $1])])dnl
AC_SUBST([$1_TRUE])dnl
AC_SUBST([$1_FALSE])dnl
_AM_SUBST_NOTMAKE([$1_TRUE])dnl
_AM_SUBST_NOTMAKE([$1_FALSE])dnl
m4_define([_AM_COND_VALUE_$1], [$2])dnl
if $2; then
  $1_TRUE=
  $1_FALSE='#'
else
  $1_TRUE='#'
  $1_FALSE=
fi
AC_CONFIG_COMMANDS_PRE(
[if test -z "${$1_TRUE}" && test -z "${$1_FALSE}"; then
  AC_MSG_ERROR([[conditional "$1" was never defined.
Usually this means the macro was only invoked conditionally.]])
fi])])

# Copyright (C) 1999-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.


# There are a few dirty hacks below to avoid letting 'AC_PROG_CC' be
# written in clear, in which case automake, when reading aclocal.m4,
# will think it sees a *use*, and therefore will trigger all it's
# C support machinery.  Also note that it means that autoscan, seeing
# CC etc. in the Makefile, will ask for an AC_PROG_CC use...


# _AM_DEPENDENCIES(NAME)
# ----------------------
# See how the compiler implements dependency checking.
# NAME is "CC", "CXX", "OBJC", "OBJCXX", "UPC", or "GJC".
# We try a few techniques and use that to set a single cache variable.
#
# We don't AC_REQUIRE the corresponding AC_PROG_CC since the latter was
# modified to invoke _AM_DEPENDENCIES(CC); we would have a circular
# dependency, and given that the user is not expected to run this macro,
# just rely on AC_PROG_CC.
AC_DEFUN([_AM_DEPENDENCIES],
[AC_REQUIRE([AM_SET_DEPDIR])dnl
AC_REQUIRE([AM_OUTPUT_DEPENDENCY_COMMANDS])dnl
AC_REQUIRE([AM_MAKE_INCLUDE])dnl
AC_REQUIRE([AM_DEP_TRACK])dnl

m4_if([$1], [CC],   [depcc="$CC"   am_compiler_list=],
      [$1], [CXX],  [depcc="$CXX"  am_compiler_list=],
      [$1], [OBJC], [depcc="$OBJC" am_compiler_list='gcc3 gcc'],
      [$1], [OBJCXX], [depcc="$OBJCXX" am_compiler_list='gcc3 gcc'],
      [$1], [UPC],  [depcc="$UPC"  am_compiler_list=],
      [$1], [GCJ],  [depcc="$GCJ"  am_compiler_list='gcc3 gcc'],
                    [depcc="$$1"   am_compiler_list=])

AC_CACHE_CHECK([dependency style of $depcc],
               [am_cv_$1_dependencies_compiler_type],
[if test -z "$AMDEP_TRUE" && test -f "$am_depcomp"; then
  # We make a subdir and do the tests there.  Otherwise we can end up
  # making bogus files that we don't know about and never remove.  For
  # instance it was reported that on HP-UX the gcc test will end up
  # making a dummy file named 'D' -- because '-MD' means "put the output
  # in D".
  rm -rf conftest.dir
  mkdir conftest.dir
  # Copy depcomp to subdir because otherwise we won't find it if we're
  # using a relative directory.
  cp "$am_depcomp" conftest.dir
  cd conftest.dir
  # We will build objects and dependencies in a subdirectory because
  # it helps to detect inapplicable dependency modes.  For instance
  # both Tru64's cc and ICC support -MD to output dependencies as a
  # side effect of compilation, but ICC will put the dependencies in
  # the current directory while Tru64 will put them in the object
  # directory.
  mkdir sub

  am_cv_$1_dependencies_compiler_type=none
  if test "$am_compiler_list" = ""; then
     am_compiler_list=`sed -n ['s/^#*\([a-zA-Z0-9]*\))$/\1/p'] < ./depcomp`
  fi
  am__universal=false
  m4_case([$1], [CC],
    [case " $depcc " in #(
     *\ -arch\ *\ -arch\ *) am__universal=true ;;
     esac],
    [CXX],
    [case " $depcc " in #(
     *\ -arch\ *\ -arch\ *) am__universal=true ;;
     esac])

  for depmode in $am_compiler_list; do
    # Setup a source with many dependencies, because some compilers
    # like to wrap large dependency lists on column 80 (with \), and
    # we should not choose a depcomp mode which is confused by this.
    #
    # We need to recreate these files for each test, as the compiler may
    # overwrite some of them when testing with obscure command lines.
    # This happens at least with the AIX C compiler.
    : > sub/conftest.c
    for i in 1 2 3 4 5 6; do
      echo '#include "conftst'$i'.h"' >> sub/conftest.c
      # Using ": > sub/conftst$i.h" creates only sub/conftst1.h with
      # Solaris 10 /bin/sh.
      echo '/* dummy */' > sub/conftst$i.h
    done
    echo "${am__include} ${am__quote}sub/conftest.Po${am__quote}" > confmf

    # We check with '-c' and '-o' for the sake of the "dashmstdout"
    # mode.  It turns out that the SunPro C++ compiler does not properly
    # handle '-M -o', and we need to detect this.  Also, some Intel
    # versions had trouble with output in subdirs.
    am__obj=sub/conftest.${OBJEXT-o}
    am__minus_obj="-o $am__obj"
    case $depmode in
    gcc)
      # This depmode causes a compiler race in universal mode.
      test "$am__universal" = false || continue
      ;;
    nosideeffect)
      # After this tag, mechanisms are not by side-effect, so they'll
      # only be used when explicitly requested.
      if test "x$enable_dependency_tracking" = xyes; then
	continue
      else
	break
      fi
      ;;
    msvc7 | msvc7msys | msvisualcpp | msvcmsys)
      # This compiler won't grok '-c -o', but also, the minuso test has
      # not run yet.  These depmodes are late enough in the game, and
      # so weak that their functioning should not be impacted.
      am__obj=conftest.${OBJEXT-o}
      am__minus_obj=
      ;;
    none) break ;;
    esac
    if depmode=$depmode \
       source=sub/conftest.c object=$am__obj \
       depfile=sub/conftest.Po tmpdepfile=sub/conftest.TPo \
       $SHELL ./depcomp $depcc -c $am__minus_obj sub/conftest.c \
         >/dev/null 2>conftest.err &&
       grep sub/conftst1.h sub/conftest.Po > /dev/null 2>&1 &&
       grep sub/conftst6.h sub/conftest.Po > /dev/null 2>&1 &&
       grep $am__obj sub/conftest.Po > /dev/null 2>&1 &&
       ${MAKE-make} -s -f confmf > /dev/null 2>&1; then
      # icc doesn't choke on unknown options, it will just issue warnings
      # or remarks (even with -Werror).  So we grep stderr for any message
      # that says an option was ignored or not supported.
      # When given -MP, icc 7.0 and 7.1 complain thusly:
      #   icc: Command line warning: ignoring option '-M'; no argument required
      # The diagnosis changed in icc 8.0:
      #   icc: Command line remark: option '-MP' not supported
      if (grep 'ignoring option' conftest.err ||
          grep 'not supported' conftest.err) >/dev/null 2>&1; then :; else
        am_cv_$1_dependencies_compiler_type=$depmode
        break
      fi
    fi
  done

  cd ..
  rm -rf conftest.dir
else
  am_cv_$1_dependencies_compiler_type=none
fi
])
AC_SUBST([$1DEPMODE], [depmode=$am_cv_$1_dependencies_compiler_type])
AM_CONDITIONAL([am__fastdep$1], [
  test "x$enable_dependency_tracking" != xno \
  && test "$am_cv_$1_dependencies_compiler_type" = gcc3])
])


# AM_SET_DEPDIR
# -------------
# Choose a directory name for dependency files.
# This macro is AC_REQUIREd in _AM_DEPENDENCIES.
AC_DEFUN([AM_SET_DEPDIR],
[AC_REQUIRE([AM_SET_LEADING_DOT])dnl
AC_SUBST([DEPDIR], ["${am__leading_dot}deps"])dnl
])


# AM_DEP_TRACK
# ------------
AC_DEFUN([AM_DEP_TRACK],
[AC_ARG_ENABLE([dependency-tracking], [dnl
AS_HELP_STRING(
  [--enable-dependency-tracking],
  [do not reject slow dependency extractors])
AS_HELP_STRING(
  [--disable-dependency-tracking],
  [speeds up one-time build])])
if test "x$enable_dependency_tracking" != xno; then
  am_depcomp="$ac_aux_dir/depcomp"
  AMDEPBACKSLASH='\'
  am__nodep='_no'
fi
AM_CONDITIONAL([AMDEP], [test "x$enable_dependency_tracking" != xno])
AC_SUBST([AMDEPBACKSLASH])dnl
_AM_SUBST_NOTMAKE([AMDEPBACKSLASH])dnl
AC_SUBST([am__nodep])dnl
_AM_SUBST_NOTMAKE([am__nodep])dnl
])

# Generate code to set up dependency tracking.              -*- Autoconf -*-

# Copyright (C) 1999-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_OUTPUT_DEPENDENCY_COMMANDS
# ------------------------------
AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
[{
  # Older Autoconf quotes --file arguments for eval, but not when files
  # are listed without --file.  Let's play safe and only enable the eval
  # if we detect the quoting.
  # TODO: see whether this extra hack can be removed once we start
  # requiring Autoconf 2.70 or later.
  AS_CASE([$CONFIG_FILES],
          [*\'*], [eval set x "$CONFIG_FILES"],
          [*], [set x $CONFIG_FILES])
  shift
  # Used to flag and report bootstrapping failures.
  am_rc=0
  for am_mf
  do
    # Strip MF so we end up with the name of the file.
    am_mf=`AS_ECHO(["$am_mf"]) | sed -e 's/:.*$//'`
    # Check whether this is an Automake generated Makefile which includes
    # dependency-tracking related rules and includes.
    # Grep'ing the whole file directly is not great: AIX grep has a line
    # limit of 2048, but all sed's we know have understand at least 4000.
    sed -n 's,^am--depfiles:.*,X,p' "$am_mf" | grep X >/dev/null 2>&1 \
      || continue
    am_dirpart=`AS_DIRNAME(["$am_mf"])`
    am_filepart=`AS_BASENAME(["$am_mf"])`
    AM_RUN_LOG([cd "$am_dirpart" \
      && sed -e '/# am--include-marker/d' "$am_filepart" \
        | $MAKE -f - am--depfiles]) || am_rc=$?
  done
  if test $am_rc -ne 0; then
    AC_MSG_FAILURE([Something went wrong bootstrapping makefile fragments
    for automatic dependency tracking.  Try re-running configure with the
    '--disable-dependency-tracking' option to at least be able to build
    the package (albeit without support for automatic dependency tracking).])
  fi
  AS_UNSET([am_dirpart])
  AS_UNSET([am_filepart])
  AS_UNSET([am_mf])
  AS_UNSET([am_rc])
  rm -f conftest-deps.mk
}
])# _AM_OUTPUT_DEPENDENCY_COMMANDS


# AM_OUTPUT_DEPENDENCY_COMMANDS
# -----------------------------
# This macro should only be invoked once -- use via AC_REQUIRE.
#
# This code is only required when automatic dependency tracking is enabled.
# This creates each '.Po' and '.Plo' makefile fragment that we'll need in
# order to bootstrap the dependency handling code.
AC_DEFUN([AM_OUTPUT_DEPENDENCY_COMMANDS],
[AC_CONFIG_COMMANDS([depfiles],
     [test x"$AMDEP_TRUE" != x"" || _AM_OUTPUT_DEPENDENCY_COMMANDS],
     [AMDEP_TRUE="$AMDEP_TRUE" MAKE="${MAKE-make}"])])

# Do all the work for Automake.                             -*- Autoconf -*-

# Copyright (C) 1996-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This macro actually does too much.  Some checks are only needed if
# your package does certain things.  But this isn't really a big deal.

dnl Redefine AC_PROG_CC to automatically invoke _AM_PROG_CC_C_O.
m4_define([AC_PROG_CC],
m4_defn([AC_PROG_CC])
[_AM_PROG_CC_C_O
])

# AM_INIT_AUTOMAKE(PACKAGE, VERSION, [NO-DEFINE])
# AM_INIT_AUTOMAKE([OPTIONS])
# -----------------------------------------------
# The call with PACKAGE and VERSION arguments is the old style
# call (pre autoconf-2.50), which is being phased out.  PACKAGE
# and VERSION should now be passed to AC_INIT and removed from
# the call to AM_INIT_AUTOMAKE.
# We support both call styles for the transition.  After
# the next Automake release, Autoconf can make the AC_INIT
# arguments mandatory, and then we can depend on a new Autoconf
# release and drop the old call support.
AC_DEFUN([AM_INIT_AUTOMAKE],
[AC_PREREQ([2.65])dnl
dnl Autoconf wants to disallow AM_ names.  We explicitly allow
dnl the ones we care about.
m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl
AC_REQUIRE([AM_SET_CURRENT_AUTOMAKE_VERSION])dnl
AC_REQUIRE([AC_PROG_INSTALL])dnl
if test "`cd $srcdir && pwd`" != "`pwd`"; then
  # Use -I$(srcdir) only when $(srcdir) != ., so that make's output
  # is not polluted with repeated "-I."
  AC_SUBST([am__isrc], [' -I$(srcdir)'])_AM_SUBST_NOTMAKE([am__isrc])dnl
  # test to see if srcdir already configured
  if test -f $srcdir/config.status; then
    AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
  fi
fi

# test whether we have cygpath
if test -z "$CYGPATH_W"; then
  if (cygpath --version) >/dev/null 2>/dev/null; then
    CYGPATH_W='cygpath -w'
  else
    CYGPATH_W=echo
  fi
fi
AC_SUBST([CYGPATH_W])

# Define the identity of the package.
dnl Distinguish between old-style and new-style calls.
m4_ifval([$2],
[AC_DIAGNOSE([obsolete],
             [$0: two- and three-arguments forms are deprecated.])
m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
 AC_SUBST([PACKAGE], [$1])dnl
 AC_SUBST([VERSION], [$2])],
[_AM_SET_OPTIONS([$1])dnl
dnl Diagnose old-style AC_INIT with new-style AM_AUTOMAKE_INIT.
m4_if(
  m4_ifdef([AC_PACKAGE_NAME], [ok]):m4_ifdef([AC_PACKAGE_VERSION], [ok]),
  [ok:ok],,
  [m4_fatal([AC_INIT should be called with package and version arguments])])dnl
 AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
 AC_SUBST([VERSION], ['AC_PACKAGE_VERSION'])])dnl

_AM_IF_OPTION([no-define],,
[AC_DEFINE_UNQUOTED([PACKAGE], ["$PACKAGE"], [Name of package])
 AC_DEFINE_UNQUOTED([VERSION], ["$VERSION"], [Version number of package])])dnl

# Some tools Automake needs.
AC_REQUIRE([AM_SANITY_CHECK])dnl
AC_REQUIRE([AC_ARG_PROGRAM])dnl
AM_MISSING_PROG([ACLOCAL], [aclocal-${am__api_version}])
AM_MISSING_PROG([AUTOCONF], [autoconf])
AM_MISSING_PROG([AUTOMAKE], [automake-${am__api_version}])
AM_MISSING_PROG([AUTOHEADER], [autoheader])
AM_MISSING_PROG([MAKEINFO], [makeinfo])
AC_REQUIRE([AM_PROG_INSTALL_SH])dnl
AC_REQUIRE([AM_PROG_INSTALL_STRIP])dnl
AC_REQUIRE([AC_PROG_MKDIR_P])dnl
# For better backward compatibility.  To be removed once Automake 1.9.x
# dies out for good.  For more background, see:
# <https://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
# <https://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
# We need awk for the "check" target (and possibly the TAP driver).  The
# system "awk" is bad on some platforms.
AC_REQUIRE([AC_PROG_AWK])dnl
AC_REQUIRE([AC_PROG_MAKE_SET])dnl
AC_REQUIRE([AM_SET_LEADING_DOT])dnl
_AM_IF_OPTION([tar-ustar], [_AM_PROG_TAR([ustar])],
	      [_AM_IF_OPTION([tar-pax], [_AM_PROG_TAR([pax])],
			     [_AM_PROG_TAR([v7])])])
_AM_IF_OPTION([no-dependencies],,
[AC_PROVIDE_IFELSE([AC_PROG_CC],
		  [_AM_DEPENDENCIES([CC])],
		  [m4_define([AC_PROG_CC],
			     m4_defn([AC_PROG_CC])[_AM_DEPENDENCIES([CC])])])dnl
AC_PROVIDE_IFELSE([AC_PROG_CXX],
		  [_AM_DEPENDENCIES([CXX])],
		  [m4_define([AC_PROG_CXX],
			     m4_defn([AC_PROG_CXX])[_AM_DEPENDENCIES([CXX])])])dnl
AC_PROVIDE_IFELSE([AC_PROG_OBJC],
		  [_AM_DEPENDENCIES([OBJC])],
		  [m4_define([AC_PROG_OBJC],
			     m4_defn([AC_PROG_OBJC])[_AM_DEPENDENCIES([OBJC])])])dnl
AC_PROVIDE_IFELSE([AC_PROG_OBJCXX],
		  [_AM_DEPENDENCIES([OBJCXX])],
		  [m4_define([AC_PROG_OBJCXX],
			     m4_defn([AC_PROG_OBJCXX])[_AM_DEPENDENCIES([OBJCXX])])])dnl
])
AC_REQUIRE([AM_SILENT_RULES])dnl
dnl The testsuite driver may need to know about EXEEXT, so add the
dnl 'am__EXEEXT' conditional if _AM_COMPILER_EXEEXT was seen.  This
dnl macro is hooked onto _AC_COMPILER_EXEEXT early, see below.
AC_CONFIG_COMMANDS_PRE(dnl
[m4_provide_if([_AM_COMPILER_EXEEXT],
  [AM_CONDITIONAL([am__EXEEXT], [test -n "$EXEEXT"])])])dnl

# POSIX will say in a future version that running "rm -f" with no argument
# is OK; and we want to be able to make that assumption in our Makefile
# recipes.  So use an aggressive probe to check that the usage we want is
# actually supported "in the wild" to an acceptable degree.
# See automake bug#10828.
# To make any issue more visible, cause the running configure to be aborted
# by default if the 'rm' program in use doesn't match our expectations; the
# user can still override this though.
if rm -f && rm -fr && rm -rf; then : OK; else
  cat >&2 <<'END'
Oops!

Your 'rm' program seems unable to run without file operands specified
on the command line, even when the '-f' option is present.  This is contrary
to the behaviour of most rm programs out there, and not conforming with
the upcoming POSIX standard: <http://austingroupbugs.net/view.php?id=542>

Please tell bug-automake@gnu.org about your system, including the value
of your $PATH and any error possibly output before this message.  This
can help us improve future automake versions.

END
  if test x"$ACCEPT_INFERIOR_RM_PROGRAM" = x"yes"; then
    echo 'Configuration will proceed anyway, since you have set the' >&2
    echo 'ACCEPT_INFERIOR_RM_PROGRAM variable to "yes"' >&2
    echo >&2
  else
    cat >&2 <<'END'
Aborting the configuration process, to ensure you take notice of the issue.

You can download and install GNU coreutils to get an 'rm' implementation
that behaves properly: <https://www.gnu.org/software/coreutils/>.

If you want to complete the configuration process using your problematic
'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGRAM
to "yes", and re-run configure.

END
    AC_MSG_ERROR([Your 'rm' program is bad, sorry.])
  fi
fi
dnl The trailing newline in this macro's definition is deliberate, for
dnl backward compatibility and to allow trailing 'dnl'-style comments
dnl after the AM_INIT_AUTOMAKE invocation. See automake bug#16841.
])

dnl Hook into '_AC_COMPILER_EXEEXT' early to learn its expansion.  Do not
dnl add the conditional right here, as _AC_COMPILER_EXEEXT may be further
dnl mangled by Autoconf and run in a shell conditional statement.
m4_define([_AC_COMPILER_EXEEXT],
m4_defn([_AC_COMPILER_EXEEXT])[m4_provide([_AM_COMPILER_EXEEXT])])

# When config.status generates a header, we must update the stamp-h file.
# This file resides in the same directory as the config header
# that is generated.  The stamp files are numbered to have different names.

# Autoconf calls _AC_AM_CONFIG_HEADER_HOOK (when defined) in the
# loop where config.status creates the headers, so we can generate
# our stamp files there.
AC_DEFUN([_AC_AM_CONFIG_HEADER_HOOK],
[# Compute $1's index in $config_headers.
_am_arg=$1
_am_stamp_count=1
for _am_header in $config_headers :; do
  case $_am_header in
    $_am_arg | $_am_arg:* )
      break ;;
    * )
      _am_stamp_count=`expr $_am_stamp_count + 1` ;;
  esac
done
echo "timestamp for $_am_arg" >`AS_DIRNAME(["$_am_arg"])`/stamp-h[]$_am_stamp_count])

# Copyright (C) 2001-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_INSTALL_SH
# ------------------
# Define $install_sh.
AC_DEFUN([AM_PROG_INSTALL_SH],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
if test x"${install_sh+set}" != xset; then
  case $am_aux_dir in
  *\ * | *\	*)
    install_sh="\${SHELL} '$am_aux_dir/install-sh'" ;;
  *)
    install_sh="\${SHELL} $am_aux_dir/install-sh"
  esac
fi
AC_SUBST([install_sh])])

# Copyright (C) 2003-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# Check whether the underlying file-system supports filenames
# with a leading dot.  For instance MS-DOS doesn't.
AC_DEFUN([AM_SET_LEADING_DOT],
[rm -rf .tst 2>/dev/null
mkdir .tst 2>/dev/null
if test -d .tst; then
  am__leading_dot=.
else
  am__leading_dot=_
fi
rmdir .tst 2>/dev/null
AC_SUBST([am__leading_dot])])

# Check to see how 'make' treats includes.	            -*- Autoconf -*-

# Copyright (C) 2001-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_MAKE_INCLUDE()
# -----------------
# Check whether make has an 'include' directive that can support all
# the idioms we need for our automatic dependency tracking code.
AC_DEFUN([AM_MAKE_INCLUDE],
[AC_MSG_CHECKING([whether ${MAKE-make} supports the include directive])
cat > confinc.mk << 'END'
am__doit:
	@echo this is the am__doit target >confinc.out
.PHONY: am__doit
END
am__include="#"
am__quote=
# BSD make does it like this.
echo '.include "confinc.mk" # ignored' > confmf.BSD
# Other make implementations (GNU, Solaris 10, AIX) do it like this.
echo 'include confinc.mk # ignored' > confmf.GNU
_am_result=no
for s in GNU BSD; do
  AM_RUN_LOG([${MAKE-make} -f confmf.$s && cat confinc.out])
  AS_CASE([$?:`cat confinc.out 2>/dev/null`],
      ['0:this is the am__doit target'],
      [AS_CASE([$s],
          [BSD], [am__include='.include' am__quote='"'],
          [am__include='include' am__quote=''])])
  if test "$am__include" != "#"; then
    _am_result="yes ($s style)"
    break
  fi
done
rm -f confinc.* confmf.*
AC_MSG_RESULT([${_am_result}])
AC_SUBST([am__include])])
AC_SUBST([am__quote])])

# Fake the existence of programs that GNU maintainers use.  -*- Autoconf -*-

# Copyright (C) 1997-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_MISSING_PROG(NAME, PROGRAM)
# ------------------------------
AC_DEFUN([AM_MISSING_PROG],
[AC_REQUIRE([AM_MISSING_HAS_RUN])
$1=${$1-"${am_missing_run}$2"}
AC_SUBST($1)])

# AM_MISSING_HAS_RUN
# ------------------
# Define MISSING if not defined so far and test if it is modern enough.
# If it is, set am_missing_run to use it, otherwise, to nothing.
AC_DEFUN([AM_MISSING_HAS_RUN],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
AC_REQUIRE_AUX_FILE([missing])dnl
if test x"${MISSING+set}" != xset; then
  case $am_aux_dir in
  *\ * | *\	*)
    MISSING="\${SHELL} \"$am_aux_dir/missing\"" ;;
  *)
    MISSING="\${SHELL} $am_aux_dir/missing" ;;
  esac
fi
# Use eval to expand $SHELL
if eval "$MISSING --is-lightweight"; then
  am_missing_run="$MISSING "
else
  am_missing_run=
  AC_MSG_WARN(['missing' script is too old or missing])
fi
])

# Helper functions for option handling.                     -*- Autoconf -*-

# Copyright (C) 2001-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_MANGLE_OPTION(NAME)
# -----------------------
AC_DEFUN([_AM_MANGLE_OPTION],
[[_AM_OPTION_]m4_bpatsubst($1, [[^a-zA-Z0-9_]], [_])])

# _AM_SET_OPTION(NAME)
# --------------------
# Set option NAME.  Presently that only means defining a flag for this option.
AC_DEFUN([_AM_SET_OPTION],
[m4_define(_AM_MANGLE_OPTION([$1]), [1])])

# _AM_SET_OPTIONS(OPTIONS)
# ------------------------
# OPTIONS is a space-separated list of Automake options.
AC_DEFUN([_AM_SET_OPTIONS],
[m4_foreach_w([_AM_Option], [$1], [_AM_SET_OPTION(_AM_Option)])])

# _AM_IF_OPTION(OPTION, IF-SET, [IF-NOT-SET])
# -------------------------------------------
# Execute IF-SET if OPTION is set, IF-NOT-SET otherwise.
AC_DEFUN([_AM_IF_OPTION],
[m4_ifset(_AM_MANGLE_OPTION([$1]), [$2], [$3])])

# Copyright (C) 1999-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_PROG_CC_C_O
# ---------------
# Like AC_PROG_CC_C_O, but changed for automake.  We rewrite AC_PROG_CC
# to automatically call this.
AC_DEFUN([_AM_PROG_CC_C_O],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
AC_REQUIRE_AUX_FILE([compile])dnl
AC_LANG_PUSH([C])dnl
AC_CACHE_CHECK(
  [whether $CC understands -c and -o together],
  [am_cv_prog_cc_c_o],
  [AC_LANG_CONFTEST([AC_LANG_PROGRAM([])])
  # Make sure it works both with $CC and with simple cc.
  # Following AC_PROG_CC_C_O, we do the test twice because some
  # compilers refuse to overwrite an existing .o file with -o,
  # though they will create one.
  am_cv_prog_cc_c_o=yes
  for am_i in 1 2; do
    if AM_RUN_LOG([$CC -c conftest.$ac_ext -o conftest2.$ac_objext]) \
         && test -f conftest2.$ac_objext; then
      : OK
    else
      am_cv_prog_cc_c_o=no
      break
    fi
  done
  rm -f core conftest*
  unset am_i])
if test "$am_cv_prog_cc_c_o" != yes; then
   # Losing compiler, so override with the script.
   # FIXME: It is wrong to rewrite CC.
   # But if we don't then we get into trouble of one sort or another.
   # A longer-term fix would be to have automake use am__CC in this case,
   # and then we could set am__CC="\$(top_srcdir)/compile \$(CC)"
   CC="$am_aux_dir/compile $CC"
fi
AC_LANG_POP([C])])

# For backward compatibility.
AC_DEFUN_ONCE([AM_PROG_CC_C_O], [AC_REQUIRE([AC_PROG_CC])])

# Copyright (C) 2001-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_RUN_LOG(COMMAND)
# -------------------
# Run COMMAND, save the exit status in ac_status, and log it.
# (This has been adapted from Autoconf's _AC_RUN_LOG macro.)
AC_DEFUN([AM_RUN_LOG],
[{ echo "$as_me:$LINENO: $1" >&AS_MESSAGE_LOG_FD
   ($1) >&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD
   ac_status=$?
   echo "$as_me:$LINENO: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
   (exit $ac_status); }])

# Check to make sure that the build environment is sane.    -*- Autoconf -*-

# Copyright (C) 1996-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_SANITY_CHECK
# ---------------
AC_DEFUN([AM_SANITY_CHECK],
[AC_MSG_CHECKING([whether build environment is sane])
# Reject unsafe characters in $srcdir or the absolute working directory
# name.  Accept space and tab only in the latter.
am_lf='
'
case `pwd` in
  *[[\\\"\#\$\&\'\`$am_lf]]*)
    AC_MSG_ERROR([unsafe absolute working directory name]);;
esac
case $srcdir in
  *[[\\\"\#\$\&\'\`$am_lf\ \	]]*)
    AC_MSG_ERROR([unsafe srcdir value: '$srcdir']);;
esac

# Do 'set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   am_has_slept=no
   for am_try in 1 2; do
     echo "timestamp, slept: $am_has_slept" > conftest.file
     set X `ls -Lt "$srcdir/configure" conftest.file 2> /dev/null`
     if test "$[*]" = "X"; then
	# -L didn't work.
	set X `ls -t "$srcdir/configure" conftest.file`
     fi
     if test "$[*]" != "X $srcdir/configure conftest.file" \
	&& test "$[*]" != "X conftest.file $srcdir/configure"; then

	# If neither matched, then we have a broken ls.  This can happen
	# if, for instance, CONFIG_SHELL is bash and it inherits a
	# broken ls alias from the environment.  This has actually
	# happened.  Such a system could not be considered "sane".
	AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
  alias in your environment])
     fi
     if test "$[2]" = conftest.file || test $am_try -eq 2; then
       break
     fi
     # Just in case.
     sleep 1
     am_has_slept=yes
   done
   test "$[2]" = conftest.file
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
AC_MSG_RESULT([yes])
# If we didn't sleep, we still need to ensure time stamps of config.status and
# generated files are strictly newer.
am_sleep_pid=
if grep 'slept: no' conftest.file >/dev/null 2>&1; then
  ( sleep 1 ) &
  am_sleep_pid=$!
fi
AC_CONFIG_COMMANDS_PRE(
  [AC_MSG_CHECKING([that generated files are newer than configure])
   if test -n "$am_sleep_pid"; then
     # Hide warnings about reused PIDs.
     wait $am_sleep_pid 2>/dev/null
   fi
   AC_MSG_RESULT([done])])
rm -f conftest.file
])

# Copyright (C) 2009-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_SILENT_RULES([DEFAULT])
# --------------------------
# Enable less verbose build rules; with the default set to DEFAULT
# ("yes" being less verbose, "no" or empty being verbose).
AC_DEFUN([AM_SILENT_RULES],
[AC_ARG_ENABLE([silent-rules], [dnl
AS_HELP_STRING(
  [--enable-silent-rules],
  [less verbose build output (undo: "make V=1")])
AS_HELP_STRING(
  [--disable-silent-rules],
  [verbose build output (undo: "make V=0")])dnl
])
case $enable_silent_rules in @%:@ (((
  yes) AM_DEFAULT_VERBOSITY=0;;
   no) AM_DEFAULT_VERBOSITY=1;;
    *) AM_DEFAULT_VERBOSITY=m4_if([$1], [yes], [0], [1]);;
esac
dnl
dnl A few 'make' implementations (e.g., NonStop OS and NextStep)
dnl do not support nested variable expansions.
dnl See automake bug#9928 and bug#10237.
am_make=${MAKE-make}
AC_CACHE_CHECK([whether $am_make supports nested variables],
   [am_cv_make_support_nested_variables],
   [if AS_ECHO([['TRUE=$(BAR$(V))
BAR0=false
BAR1=true
V=1
am__doit:
	@$(TRUE)
.PHONY: am__doit']]) | $am_make -f - >/dev/null 2>&1; then
  am_cv_make_support_nested_variables=yes
else
  am_cv_make_support_nested_variables=no
fi])
if test $am_cv_make_support_nested_variables = yes; then
  dnl Using '$V' instead of '$(V)' breaks IRIX make.
  AM_V='$(V)'
  AM_DEFAULT_V='$(AM_DEFAULT_VERBOSITY)'
else
  AM_V=$AM_DEFAULT_VERBOSITY
  AM_DEFAULT_V=$AM_DEFAULT_VERBOSITY
fi
AC_SUBST([AM_V])dnl
AM_SUBST_NOTMAKE([AM_V])dnl
AC_SUBST([AM_DEFAULT_V])dnl
AM_SUBST_NOTMAKE([AM_DEFAULT_V])dnl
AC_SUBST([AM_DEFAULT_VERBOSITY])dnl
AM_BACKSLASH='\'
AC_SUBST([AM_BACKSLASH])dnl
_AM_SUBST_NOTMAKE([AM_BACKSLASH])dnl
])

# Copyright (C) 2001-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_INSTALL_STRIP
# ---------------------
# One issue with vendor 'install' (even GNU) is that you can't
# specify the program used to strip binaries.  This is especially
# annoying in cross-compiling environments, where the build's strip
# is unlikely to handle the host's binaries.
# Fortunately install-sh will honor a STRIPPROG variable, so we
# always use install-sh in "make install-strip", and initialize
# STRIPPROG with the value of the STRIP variable (set by the user).
AC_DEFUN([AM_PROG_INSTALL_STRIP],
[AC_REQUIRE([AM_PROG_INSTALL_SH])dnl
# Installed binaries are usually stripped using 'strip' when the user
# run "make install-strip".  However 'strip' might not be the right
# tool to use in cross-compilation environments, therefore Automake
# will honor the 'STRIP' environment variable to overrule this program.
dnl Don't test for $cross_compiling = yes, because it might be 'maybe'.
if test "$cross_compiling" != no; then
  AC_CHECK_TOOL([STRIP], [strip], :)
fi
INSTALL_STRIP_PROGRAM="\$(install_sh) -c -s"
AC_SUBST([INSTALL_STRIP_PROGRAM])])

# Copyright (C) 2006-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_SUBST_NOTMAKE(VARIABLE)
# ---------------------------
# Prevent Automake from outputting VARIABLE = @VARIABLE@ in Makefile.in.
# This macro is traced by Automake.
AC_DEFUN([_AM_SUBST_NOTMAKE])

# AM_SUBST_NOTMAKE(VARIABLE)
# --------------------------
# Public sister of _AM_SUBST_NOTMAKE.
AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_NOTMAKE($@)])

# Check how to create a tarball.                            -*- Autoconf -*-

# Copyright (C) 2004-2018 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_PROG_TAR(FORMAT)
# --------------------
# Check how to create a tarball in format FORMAT.
# FORMAT should be one of 'v7', 'ustar', or 'pax'.
#
# Substitute a variable $(am__tar) that is a command
# writing to stdout a FORMAT-tarball containing the directory
# $tardir.
#     tardir=directory && $(am__tar) > result.tar
#
# Substitute a variable $(am__untar) that extract such
# a tarball read from stdin.
#     $(am__untar) < result.tar
#
AC_DEFUN([_AM_PROG_TAR],
[# Always define AMTAR for backward compatibility.  Yes, it's still used
# in the wild :-(  We should find a proper way to deprecate it ...
AC_SUBST([AMTAR], ['$${TAR-tar}'])

# We'll loop over all known methods to create a tar archive until one works.
_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'

m4_if([$1], [v7],
  [am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'],

  [m4_case([$1],
    [ustar],
     [# The POSIX 1988 'ustar' format is defined with fixed-size fields.
      # There is notably a 21 bits limit for the UID and the GID.  In fact,
      # the 'pax' utility can hang on bigger UID/GID (see automake bug#8343
      # and bug#13588).
      am_max_uid=2097151 # 2^21 - 1
      am_max_gid=$am_max_uid
      # The $UID and $GID variables are not portable, so we need to resort
      # to the POSIX-mandated id(1) utility.  Errors in the 'id' calls
      # below are definitely unexpected, so allow the users to see them
      # (that is, avoid stderr redirection).
      am_uid=`id -u || echo unknown`
      am_gid=`id -g || echo unknown`
      AC_MSG_CHECKING([whether UID '$am_uid' is supported by ustar format])
      if test $am_uid -le $am_max_uid; then
         AC_MSG_RESULT([yes])
      else
         AC_MSG_RESULT([no])
         _am_tools=none
      fi
      AC_MSG_CHECKING([whether GID '$am_gid' is supported by ustar format])
      if test $am_gid -le $am_max_gid; then
         AC_MSG_RESULT([yes])
      else
        AC_MSG_RESULT([no])
        _am_tools=none
      fi],

  [pax],
    [],

  [m4_fatal([Unknown tar format])])

  AC_MSG_CHECKING([how to create a $1 tar archive])

  # Go ahead even if we have the value already cached.  We do so because we
  # need to set the values for the 'am__tar' and 'am__untar' variables.
  _am_tools=${am_cv_prog_tar_$1-$_am_tools}

  for _am_tool in $_am_tools; do
    case $_am_tool in
    gnutar)
      for _am_tar in tar gnutar gtar; do
        AM_RUN_LOG([$_am_tar --version]) && break
      done
      am__tar="$_am_tar --format=m4_if([$1], [pax], [posix], [$1]) -chf - "'"$$tardir"'
      am__tar_="$_am_tar --format=m4_if([$1], [pax], [posix], [$1]) -chf - "'"$tardir"'
      am__untar="$_am_tar -xf -"
      ;;
    plaintar)
      # Must skip GNU tar: if it does not support --format= it doesn't create
      # ustar tarball either.
      (tar --version) >/dev/null 2>&1 && continue
      am__tar='tar chf - "$$tardir"'
      am__tar_='tar chf - "$tardir"'
      am__untar='tar xf -'
      ;;
    pax)
      am__tar='pax -L -x $1 -w "$$tardir"'
      am__tar_='pax -L -x $1 -w "$tardir"'
      am__untar='pax -r'
      ;;
    cpio)
      am__tar='find "$$tardir" -print | cpio -o -H $1 -L'
      am__tar_='find "$tardir" -print | cpio -o -H $1 -L'
      am__untar='cpio -i -H $1 -d'
      ;;
    none)
      am__tar=false
      am__tar_=false
      am__untar=false
      ;;
    esac

    # If the value was cached, stop now.  We just wanted to have am__tar
    # and am__untar set.
    test -n "${am_cv_prog_tar_$1}" && break

    # tar/untar a dummy directory, and stop if the command works.
    rm -rf conftest.dir
    mkdir conftest.dir
    echo GrepMe > conftest.dir/file
    AM_RUN_LOG([tardir=conftest.dir && eval $am__tar_ >conftest.tar])
    rm -rf conftest.dir
    if test -s conftest.tar; then
      AM_RUN_LOG([$am__untar <conftest.tar])
      AM_RUN_LOG([cat conftest.dir/file])
      grep GrepMe conftest.dir/file >/dev/null 2>&1 && break
    fi
  done
  rm -rf conftest.dir

  AC_CACHE_VAL([am_cv_prog_tar_$1], [am_cv_prog_tar_$1=$_am_tool])
  AC_MSG_RESULT([$am_cv_prog_tar_$1])])

AC_SUBST([am__tar])
AC_SUBST([am__untar])
]) # _AM_PROG_TAR

m4_include([m4/gettext.m4])
m4_include([m4/iconv.m4])
m4_include([m4/intlmacosx.m4])
m4_include([m4/lib-ld.m4])
m4_include([m4/lib-link.m4])
m4_include([m4/lib-prefix.m4])
m4_include([m4/nls.m4])
m4_include([m4/po.m4])
m4_include([m4/progtest.m4])
