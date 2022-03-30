#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# yarn cache clean
# yarn install

# tail -f /dev/null
bundle exec rails s -b 0.0.0.0
