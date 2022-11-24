FROM maven:3.6.3-openjdk-8 as builder
COPY . /app/
WORKDIR /app

RUN mvn verify


FROM openjdk:8-jre-alpine

WORKDIR /app
COPY --from=builder /app/target/* ./target

#COPY /app/nginx_config/ /app/nginx_config/

# ENV LAVAGNA_SCRIPT="/app/bin"
# ENV PATH=$LAVAGNA_SCRIPT:$PATH
# RUN chmod 755 /app/bin/entrypoint.sh

# local file as database enviroment settings 
# ENV DB_DIALECT HSQLDB
# ENV DB_URL jdbc:hsqldb:mem:lavagna
# ENV DB_USER sa
# ENV DB_PASS ""
# ENV SPRING_PROFILE dev

#ENTRYPOINT [ "/app/bin/entrypoint.sh" ]



