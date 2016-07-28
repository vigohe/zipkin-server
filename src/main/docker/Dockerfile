FROM java:8-jre
ADD *.jar /entrypoint/app.jar
COPY docker-entrypoint.sh /entrypoint/docker-entrypoint.sh
RUN chmod u+x /entrypoint/docker-entrypoint.sh \
    && touch /entrypoint/app.jar
EXPOSE 9411
ENTRYPOINT ["/entrypoint/docker-entrypoint.sh"]