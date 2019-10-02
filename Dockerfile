FROM openjdk:8-jre-alpine

ARG APP_VERSION=0.1.0-SNAPSHOT

WORKDIR /opt/contacts-app

RUN apk --no-cache add curl
RUN curl -o h2driver.jar https://repo1.maven.org/maven2/com/h2database/h2/1.4.199/h2-1.4.199.jar

COPY target/contacts-app-$APP_VERSION.jar /opt/contacts-app/contacts-app.jar
COPY config.yaml /opt/contacts-app/config.yaml

ENTRYPOINT ["java", "-cp", "contacts-app.jar:h2driver.jar", "com.contactsapp.ContactsApplication"]
CMD ["server", "config.yaml"]