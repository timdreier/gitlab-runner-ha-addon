#!/usr/bin/with-contenv bashio

touch /config/config.toml
ln -sv /config/config.toml /etc/gitlab-runner/config.toml

if [ -s /etc/gitlab-runner/config.toml ]; then
   echo "Configuration found. Using existing configuration..."
else
   echo "No configuration found. Configuring runner..."
   gitlab-runner register \
        --non-interactive \
        --url "$(bashio::config 'url')" \
        --token "$(bashio::config 'token')" \
        --executor "docker" \
        --docker-image "$(bashio::config 'docker_image')"
fi

gitlab-runner run