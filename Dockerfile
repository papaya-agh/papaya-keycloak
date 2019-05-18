FROM jboss/keycloak:6.0.1

ADD run-papaya-keycloak.sh /opt/papaya-keycloak/run-papaya-keycloak.sh
ADD papaya-realm.json /opt/papaya-keycloak/papaya-realm.json

ARG KEYCLOAK_ADMIN_USER=admin
ARG KEYCLOAK_ADMIN_PASWORD=admin

RUN /opt/jboss/keycloak/bin/add-user-keycloak.sh -r master -u ${KEYCLOAK_ADMIN_USER} -p ${KEYCLOAK_ADMIN_PASWORD}
RUN /opt/jboss/keycloak/bin/add-user-keycloak.sh -r papaya -u ${KEYCLOAK_ADMIN_USER} -p ${KEYCLOAK_ADMIN_PASWORD}

ENTRYPOINT [ "/opt/papaya-keycloak/run-papaya-keycloak.sh" ]

CMD []
