#!/bin/bash

set -ex

# Add grafana as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- grafana-server "$@"
fi

# Step down via gosu  
if [ "$1" = 'grafana-server' ]; then
	chown -R grafana:grafana /var/log/grafana
	chown -R grafana:grafana /var/lib/grafana
	exec gosu grafana "$@"
fi

# As argument is not related to grafana,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"