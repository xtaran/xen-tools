#!/bin/sh
#
#  Automatically attempt to create a test which ensures all the modules
# used in the code are available.
#
# Steve
# --
# https://steve.fi/
#
#

cat <<EOF
#!/usr/bin/perl -w -I..
#
#  Test that all the Perl modules we require are available.
#
#  This list is automatically generated by modules.sh
#
# Steve
# --
#

use Test::More qw( no_plan );

EOF


for i in `grep '^use ' -r .. | egrep -v '^\./\.git/|Expect|POSIX|Xen::' | awk '{print $2}' | tr -d '\r;()' | sort -u`; \
    do \
     echo "BEGIN{ use_ok( '$i' ); }"; \
     echo "require_ok( '$i' );" ; \
     printf '\n' ; \
done
