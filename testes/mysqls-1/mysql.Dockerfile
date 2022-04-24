FROM mysql:8.0.28
ENV MYSQL_ROOT_PASSWORD 1234@@
ENV MYSQL_DATABASE db_t1
LABEL maintainer="Teste criando container mysql"
