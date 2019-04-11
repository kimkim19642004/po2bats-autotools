SUBDIRS= po src
ACLOCAL_AMFLAGS = -I m4
EXTRA_DIST = config.rpath m4/ChangeLog
EXTRA_DIST += ./src/po2bats.sh\
 ./tests/ChangeLog ./tests/testsuite ./tests/sh_chk.at ./tests/mk_coverage.at\
 ./tests/test_24.po ./tests/test_25.po ./tests/test_27.po\
 ./tests/test_1.at ./tests/test_2.at ./tests/test_3.at ./tests/test_4.at ./tests/test_5.at\
 ./tests/test_6.at ./tests/test_7.at ./tests/test_8.at ./tests/test_9.at ./tests/test_10.at\
 ./tests/test_11.at ./tests/test_12.at ./tests/test_13.at ./tests/test_14.at ./tests/test_15.at\
 ./tests/test_16.at ./tests/test_17.at ./tests/test_18.at ./tests/test_19.at ./tests/test_20.at\
 ./tests/test_21.at ./tests/test_22.at ./tests/test_23.at ./tests/test_24.at ./tests/test_25.at\
 ./tests/test_26.at ./tests/test_27.at ./tests/test_28.at ./tests/test_29.at ./tests/test_30.at\
 ./tests/test_31.at ./tests/test_32.at ./tests/test_33.at ./tests/test_34.at ./tests/test_35.at

@AX_GNU_AUTOTEST_DEFAULT@

installcheck-local:
	## The following test suites can not run within GNU Autotest.
	## Note: When using Ubuntu, check the values of the following environment variables: LANGUAGE, LC_*
	@if test "$(LANG)" = 'ja_JP.UTF-8' || test "$(LANG)" = 'ja_JP.utf8'; then \
		rm -f './tests/ja.bats'; \
		'$(bindir)/po2bats.sh' --msgdir='$(DESTDIR)$(localedir)' '$(top_srcdir)/po/ja.po' './tests/ja.bats' '$(PACKAGE)'; \
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
		## Note: macOS requires the following code.
		flg2=false; \
		if test ! -r '$(DESTDIR)$(localedir)/ja/LC_MESSAGES/$(PACKAGE).mo'; then \
			$(INSTALL_DATA) -CD '$(top_srcdir)/po/ja.gmo' '$(DESTDIR)$(localedir)/ja/LC_MESSAGES/$(PACKAGE).mo'; \
			if test $$? -ne 0; then \
				exit 1; \
			fi; \
			flg2=true; \
		fi; \
		##
		'./tests/ja.bats'; \
		flg=$$?; \
		## Note: macOS requires the following code.
		if $$flg2; then \
			rm -f '$(DESTDIR)$(localedir)/ja/LC_MESSAGES/$(PACKAGE).mo'; \
		fi; \
		##
		case $$flg in \
		0) ;; \
		127) \
			if test -x './tests/ja.bats'; then \
				printf '\033[0;31m%s\033[0m\n' "Package 'bats' not installed, or invalid path/link settings. See <https://github.com/bats-core/bats-core>." >&2; \
			fi; \
			exit 1;; \
		*) exit 1;; \
		esac; \
		echo; \
	fi
code-coverage-clean:
	rm -rf './tests/coverage'
code-coverage-dist-clean : code-coverage-clean
distclean-local: code-coverage-dist-clean
	## Note: Output the second test result. The first test result is not output.
	if test -e './tests/testsuite.log'; then \
		cat './tests/testsuite.log'; echo; \
	fi
	rm -f './tests/ja.bats'
clean-local: code-coverage-clean
	rm -f './tests/testsuite'

.PHONY: code-coverage-clean code-coverage-dist-clean