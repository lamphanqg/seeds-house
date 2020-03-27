#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /seeds-house/tmp/pids/server.pid

if [[ $RAILS_ENV != "development" ]]; then
  cd /seeds-house
  rake assets:precompile
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
