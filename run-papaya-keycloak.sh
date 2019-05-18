#!/usr/bin/env bash

if [[ -z "$PORT" ]]; then
    PORT=8080
fi

echo Running papaya-keycloak on port ${PORT}

/opt/jboss/tools/docker-entrypoint.sh -b 0.0.0.0 \
    -Dkeycloak.import=/opt/papaya-keycloak/papaya-realm.json \
    -Djboss.http.port=${PORT}
