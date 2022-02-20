FROM nginx:1.21.6-alpine 
LABEL maintainer="Estudo docker: jfpadilha@gmail.com"
COPY . /usr/share/nginx/html 
EXPOSE 80 

# linha 1: imagem base e versão
# linha 2: Identificação e mantenedor do projeto
# linha 3: quado montar a imagem copiar tudo para o diretório do dockerFile ( . )
# linha 4: a porta 80 do container deve ficar disponível
