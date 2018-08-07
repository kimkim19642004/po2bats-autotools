SUBDIRS= po src

ACLOCAL_AMFLAGS = -I m4

EXTRA_DIST = config.rpath m4/ChangeLog

## The following test suites can not run within GNU Autotest.
installcheck-local:
	@if test "$(LANG)" = "ja_JP.UTF-8"; then \
	  echo "## -------------------------------- ##"; \
	  echo "## Unit Tests for Message Catalog"; \
	  echo "## Target: $(DESTDIR)$(localedir)/ja/LC_MESSAGES/$(PACKAGE).mo"; \
	  echo "## whereis $$(whereis po2bats.sh)"; \
	  echo "## -------------------------------- ##"; \
	  rm -f ./tests/ja.bats; \
	  po2bats.sh --msgdir="$(DESTDIR)$(localedir)" $(top_srcdir)/po/ja.po ./tests/ja.bats "$(PACKAGE)"; \
	  flg=$$?; \
	  case $$flg in \
	  0) ;; \
	  127) \
	    printf "\033[0;31m%s\033[0m\n" "Install the package '$(PACKAGE)' from Software Repository or <$(PACKAGE_URL)>."; \
	    exit 1;; \
	  *) exit 1;; \
	  esac; \
	  ./tests/ja.bats; \
	  flg=$$?; \
	  case $$flg in \
	  0) ;; \
	  127) \
	    if test -e tests/ja.bats; then \
	      printf "\033[0;31m%s\033[0m\n" "Install the package 'bats' from Software Repository or <https://github.com/sstephenson/bats>."; \
	    fi; \
	    exit 1;; \
	  *) exit 1;; \
	  esac; \
	  echo ; \
	  echo "## -------------------------------- ##"; \
	  echo "## Unit Tests for Message Catalog"; \
	  echo "## Target: $(DESTDIR)$(localedir)/ja/LC_MESSAGES/$(PACKAGE).mo"; \
	  echo "## po2bats.sh: $(bindir)/po2bats.sh"; \
	  echo "## -------------------------------- ##"; \
	  rm -f ./tests/ja.bats; \
	  $(bindir)/po2bats.sh --msgdir="$(DESTDIR)$(localedir)" $(top_srcdir)/po/ja.po ./tests/ja.bats "$(PACKAGE)"; \
	  flg=$$?; \
	  case $$flg in \
	  0) ;; \
	  127) \
	    printf "\033[0;31m%s\033[0m\n" "Install the package '$(PACKAGE)' from Software Repository or <$(PACKAGE_URL)>."; \
	    exit 1;; \
	  *) exit 1;; \
	  esac; \
	  ./tests/ja.bats; \
	  flg=$$?; \
	  case $$flg in \
	  0) ;; \
	  127) \
	    if test -e tests/ja.bats; then \
	      printf "\033[0;31m%s\033[0m\n" "Install the package 'bats' from Software Repository or <https://github.com/sstephenson/bats>."; \
	    fi; \
	    exit 1;; \
	  *) exit 1;; \
	  esac; \
	  echo ; \
	fi;
distclean-local:
	rm -f ./tests/ja.bats
	
@AX_GNU_AUTOTEST_DEFAULT@
EXTRA_DIST += ./tests/ChangeLog\
 ./tests/unit_tests.at
