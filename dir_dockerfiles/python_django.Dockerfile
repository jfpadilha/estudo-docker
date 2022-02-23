FROM python:3.11.0a5-alpine3.15
LABEL maintainer="Estudo docker <jfpadilha@gmail.com>"
COPY . /var/www
WORKDIR /var/www
RUN apk update && apk add zlib-dev jpeg-dev gcc musl-dev && pip install -r requirements.txt && python manage.py migrate
ENTRYPOINT python manage.py runserver 0.0.0.0:8000
EXPOSE 8000

# linha 1 -> linguagem e versão
# linha 2 -> mantenedor
# linha 3 -> copiar tudo ( . ) para /var/wwww
# linha 4 -> diretório de trabalho, na qual a apliucação vai estar funcional
# linha 5 -> executar update && adicionar  bibliotecas e requisitos && "pip" é um gerenciador de pacotes do python, instalar eles a partir desse arquivo de requerimentos && executar o arquivo manage.py e "migrate" para criar banco de dados
# linha 6 -> comando que é executado no workdir, assim que o container é criado, após criar o container, qual comando será executado? nesse caso executar o server na porta 8000
# linha 7 -> é espoxta na porta 8000

