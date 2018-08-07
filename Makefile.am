SUBDIRS= po src
ACLOCAL_AMFLAGS = -I m4
EXTRA_DIST = config.rpath m4/ChangeLog

installcheck-local:
	## The following test suites can not run within GNU Autotest.
	## Note: When using Ubuntu, check the values of the following environment variables: LANGUAGE, LC_ *
	@if test "$(LANG)" = 'ja_JP.UTF-8'; then \
	  rm -f ./tests/ja.bats; \
	  '$(bindir)/po2bats.sh' --msgdir='$(DESTDIR)$(localedir)' '$(top_srcdir)/po/ja.po' ./tests/ja.bats '$(PACKAGE)'; \
	  flg=$$?; \
	  case $$flg in \
	  0) ;; \
	  127) \
	    printf '\033[0;31m%s\033[0m\n' "Package '$(PACKAGE)' not installed, or invalid path/link settings. See <$(PACKAGE_URL)>." >&2; \
	    exit 1;; \
	  *) exit 1;; \
	  esac; \
	  printf '%s\n%s\n%s\n\n%s\n\n' \
	  '## --------------------------- ##' \
	  '## message catalog test suite.' \
	  '## --------------------------- ##' \
	  'LANG=$(LANG)'; \
	  ./tests/ja.bats; \
	  flg=$$?; \
	  case $$flg in \
	  0) ;; \
	  127) \
	    if test -e ./tests/ja.bats; then \
	      printf '\033[0;31m%s\033[0m\n' "Package 'bats' not installed, or invalid path/link settings. See <https://github.com/bats-core/bats-core>." >&2; \
	    fi; \
	    exit 1;; \
	  *) exit 1;; \
	  esac; \
	  echo ; \
	fi;
distclean-local:
	rm -rf ./tests/ja.bats ./tests/coverage
clean-local:
	rm -rf ./tests/testsuite ./tests/coverage

@AX_GNU_AUTOTEST_DEFAULT@

EXTRA_DIST += ./src/po2bats.sh\
 ./tests/ChangeLog\
 ./tests/sh_chk.at\
 ./tests/test_1.at\
 ./tests/test_2.at\
 ./tests/test_3.at\
 ./tests/test_4.at\
 ./tests/test_5.at\
 ./tests/test_6.at\
 ./tests/test_7.at\
 ./tests/test_8.at\
 ./tests/test_9.at\
 ./tests/test_10.at\
 ./tests/test_11.at\
 ./tests/test_12.at\
 ./tests/test_13.at\
 ./tests/test_14.at\
 ./tests/test_15.at\
 ./tests/test_16.at\
 ./tests/test_17.at\
 ./tests/test_18.at\
 ./tests/test_19.at\
 ./tests/test_20.at\
 ./tests/test_21.at\
 ./tests/test_22.at\
 ./tests/test_23.at\
 ./tests/test_24.at\
 ./tests/test_24.po\
 ./tests/test_25.at\
 ./tests/test_25.po\
 ./tests/test_26.at\
 ./tests/test_27.at\
 ./tests/test_27.po\
 ./tests/test_28.at\
 ./tests/test_29.at\
 ./tests/mk_coverage.at
