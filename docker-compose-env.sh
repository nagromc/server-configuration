#!/usr/bin/env sh

# This is a workaround for variable substitution inside docker-compose.yml
# See https://github.com/docker/compose/issues/3435#issuecomment-272681399

set -a
. "./prod.env"
set +a
docker-compose "$@"
