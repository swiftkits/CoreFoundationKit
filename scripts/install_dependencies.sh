#!/bin/sh
#
#  install_dependencies.sh
#  CoreFoundationKit
#
#  Created by Manish
#



# export ruby path
# export PATH="$PATH:/root/.gem/ruby/2.3.0/bin"

# Fix for M1
# https://github.com/ffi/ffi/issues/864
if [[ `uname -m` == 'arm64' ]]; then
  gem install --user-install ffi -- --enable-libffi-alloc
fi

bundle install --path vendor/bundle
