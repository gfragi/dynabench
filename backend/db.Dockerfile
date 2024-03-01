FROM mysql:latest 

# Configure MySQL (environment variables for database, user, etc.)
ENV MYSQL_DATABASE=dynabench
ENV MYSQL_USER=dynauser
ENV MYSQL_PASSWORD=dynauser
ENV MYSQL_ROOT_PASSWORD=dynaroot


COPY resources/dbs/dynabench.sql /docker-entrypoint-initdb.d/ 

EXPOSE 3306 
