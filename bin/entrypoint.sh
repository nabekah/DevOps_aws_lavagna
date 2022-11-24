#!/bin/bash

BASEDIR=$(dirname $0)

java -Ddatasource.dialect="${DB_DIALECT}" -Ddatasource.url="${DB_URL}" -Ddatasource.username="${DB_USER}" -Ddatasource.password="${DB_PASS}" -Dspring.profile.active=dev -jar target/lavagna-jetty-console.war