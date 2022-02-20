ESTUDO DOCKER
================================

Estudo em formato prático e objetivo, onde aprendo e demonstro como trabalhar com containers Docker e publicando suas aplicações com eficiência, juntamente com uma notação que poderá servir de manual rápido para o dia a dia.

![](img-docker.png)

********
********
NOTAÇÃO
==========

---
Básico sobre docker | Visão geral
---
#### O que são containers?
- também conhecido como "container Linux", é uma maneira de criar ambientes isolados que podem executar código enquanto compartilham um único sistema operacional.
- Cada container é completamente isolado dos outros

#### O que é o Docker?
- docker é uma aplicação que gerencia containers por trás dos panos, permitindo que a essa tarefa torne-se mais fácil.

#### Qual a diferença entre container e máquina virtual?
- Máquina virtual: precisa de uma infraestrutura (servidor), em cima vai o sistema operacional baseado em Hypervisor onde a partir dali instala-se o(s) SO(s), instala-se as libs/bins por fim adiciona-se a aplicação, o que acaba sobrecarregando a máquina necessitando cada vez mais de espaço em disco, processamento, memória ...
- Container: é uma virtualização baseada em container ou a evolução da virtualização, a partir da infraestrutura (computador, servidor, etc) temos o SO, criamos um "Container Engine" então nele são alocadas as libs/bins e por fim as aplicações, melhorando a utilização da nossa infraestrutura

#### O que precisamos para fazer uso do Docker?
- Precisaremos apenas instalar o "Docker engine" e utilizar algum editor de códigos para criar os arquivos _(nesse estudo utilizaremos o VSCode)_
- Em Linux e Mac o "docker engine" executa containers via máquina virtual, pois containers são recursos Linux.
- O docker é uma ferramenta gratuita.
- anexo arquivo "instalacao_linux.txt" como manual para instalação no linux ubuntu e debian.

***
YAML - Yet Another Markup Language
---
#### Introdução:
- Criada em 2001 é uma linguagem não apenas de marcação, mas também uma linguagem de ***Serialização de dados***.
- ***Serialização de dados*** é uma técnica que permite converter objetos em bytes _(colocando-os em série)_ após a conversão podem ser salvos em disco ou também enviados _(via http, via socket etc)_.
- Existe o processo de ***Serializar*** _(converter objetos em bytes)_ e existe ***Desserializar*** _(converter bytes em objetos)_.

#### Estudo no código
- Arquivo ["sintaxe.yaml"](sintaxe.yaml) mostra exemplos básicos sobre sintaxe, lembrando que por boa prática, nunca se usa a tecla "tab", sempre usar a barra de espaço.

#### Mapeamento
- É o que o nome sugere, mapear uma chave a um valor, representado por arrays associativos, pares de chaves/valor, tabelas hash. Em yaml são representados por ":" e espaço, sem chaves duplicadas e podem ser aninhados. No arquivo [mapeamentos.yaml](mapeamentos.yaml) podemos ver na prática.

#### Estilos
- Existem 2 tipos de estilos em yaml:
		- Bloco, que utiliza chave + valor
		- Flow, onde ficam agrupados por chaves "{ }"
- Pode-se visualizar o exemplo em ["estilos.yaml"](estilos.yaml)

#### Sequencias
- Em yaml as sequencias podem ser listas, arrays coleções ou uma combinação entre elas
- Sequencia não pode ser vazia ou com linhas em branco
- Não pode aninhar sem fazer mapeamento
- Então, sequencia é uma lista de valores, pode-se ver mais em [sequencias.yaml](sequencias.yaml)

#### Escalares
- Valores escalares são valores únicos, ex: uma string, um boolean, ou seja, diferente de um array.
- Entende-se melhor em [escalares.yaml](escalares.yaml)

#### Estruturas
- Em yaml, podemos ter multiplas diretivas ou configurações em um único arquivo
- Para fazer a separação das diretrizes sem interferir uma em outra, utiliza-se três traços "---", explica-se mlehor em [estruturas.yaml](estruturas.yaml)

#### Comentários
- Comentários são importantes para documentar o que ocorreu ou está ocorrendo no código, em yaml são representados por " # " no início da frase

#### Tags
- Em yaml para configurar uma uri ou url usando um prefixo "%TAG"
- Configura-se tags locais
- Quanto algum software fizer a leitura do arquivo ".yaml", ele vai ver que existe uma tag, a qual informa o host então irá obter o valor 'location' conforme exemplo [tags.yaml](tags.yaml)

#### Âncoras
- Em yaml usamos âncoras para armazenar e reutilizar dados
- Define-se uma âncora com o "&"
- Para referenciar/fazer uso, utiliza-se o "*"
- Veja exemplos em [ancoras.yaml](ancoras.yaml)
---
Docker e imagens
---
#### O que são imagens em um container?
- Quando fala-se em container, imagens são os "templates" na qual usamos para criar os containers
- Quando o comando "docker run imageName" é executado, o docket tenta encontrar localmente, caso não consiga, ele tenta encontrar no docker hub.
- Uma imagem é criada a partir de um arquivo chamado "Dockerfile"<sub> _(dockerFile: são instruções linha a linha, na qual informam como criar uma imagem)_</sub>

#### Sistema de aquivos em camada
- Um dos tópicos mais importantes do **docker** é o *filesystem*, ou seja, o sistema de arquivos utilizado pela ferramenta.
- O sistema de arquivos do **Docker** é chamado de **Layered**, ou seja, é um sistema de arquivos em camadas.

#### Sistemas de arquivos no docker
- A camada de escrita que o processo/apliacação visualiza não é o mesmo rootfs base do sistema, mas sim uma camada de abstração do rootfs <sub>_(rootfs: é o local onde fica o sistema de boot do sistema operacional e o kernel)_</sub> 
- No docker temos esta arquitetura também, mas um pouco diferente:
		- A camada de escrita que o processo/aplicação visualiza não é o mesmo rootfs base do sistema mas simuma camadadeabstração do rootfs.
		- Isso faz com que um container torne-se portável, pois as modificações realizadas não são aplicadas ao sistemaorigemdocontainer e sim na camada a qual o sistema visualiza.
- Imagens são compartilhadas entre containers Docker
		- Este tipo de sistema de arquivos em camadas busca sempre a eficiência. Desta forma, containers compartilham imagens semelhantes.

#### Comandos docker

``` shell
	$ docker --version
# Mostra a versão instalada
```

```shell
	$ docker --help
# ajuda
```

```shell
	$ docker container --help
# ajuda sobre comando container
```

```shell
	$ docker container ls
# lista os containers
```

```shell
	$ docker ps
# lista os containers que estão em execução
```

```shell
	$ docker ps -a
# lista os containers que estão em execução e também os containers que estão parados
```

```shell
	$ docker start nomeContainer
# inicializa um container
```

```shell
# exemplo para baixar um container (postgres nesse caso)
	$ docker pull postgres
	
# vai apenas fazer o download da imagem e não irá executar

```

```shell
# baixar e executar um container (postgres por exemplo)
	$ docker run postgres
		
```

```shell
# listas as imagens baixadas (instaladas ou não)
	$ docker image ls
```

```shell
# remover uma imagem
	$ docker image rm image_id
	
# se a imagem estiver em uso, o docker não vai permitir a remoção dela, então pode-se remover forçadamente
		$ docker image rm image_id -f
```

###### Observação:
- Não baixar versão em "latest", informar corretamente a versão, _(recomendação)_ primeiramente acesse a imagem pretendida baixar <a href="https://hub.docker.com/_/postgres?tab=tags" target="_blank">hub.docker.com/_/postgres</a> e veja qual a última versão _(tag)_ no site mostra o comando correto
- Exemplificando com postgres:
```shell
# baixando corretamente fixando a versão da imagem
	$ docker pull postgres:9.6.24-bullseye

# desse modo estará fixada a versão na qual estarei usando
# No momento que for especificada a versão sabe-se exatamente qual versão utilizada, se estiver como "latest" pode ser qualquer versão que for a última.
```

```shell
# fazendo inspeção da imagem:

	$ docker image inspect 'image_id'
# pode-se usar apenas os 3 primeiros dígitos da image_id
```

```shell
# Criar uma imagem baseada em uma existente
	$ docker image tag  postgres:13.1 'nomeDaTagQueQueroCriar'
```

```shell
# baixando uma imagem ubuntu:
	$ docker pull ubuntu:22.04

# executando o container do ubuntu
	$ docker run ubuntu
	# vai executar e encerrar, já que não executa nenhum serviço

# executando o container ubuntu e fazer ele imprimir saída na tela
	$ docker run ubuntu echo "texto a ser impresso na tela"
	# ao finalizar irá encerrar o container
```

#### Acessando a porta do container
- Em exemplo vamos rodar o configurar o Nginx _(servidor web)_
```shell
# vamos baixar e executar a imagem, sem ficar utilizando o terminal
	$ docker run -d -e NGINX_ENTRYPOINT_QUIET_LOGS=1 nginx:1.21.6
```

- Nesse caso ao colocar _"http://localhost/"_ no navegador não vamos conseguir acessar a porta 80 do nginx, porque ele está rodando no container e não no nosso pc
- É necessário fazer um espelhamento _(mirror)_ do pc para o container, então:
```shell
	$ docker run -d -p 8080:80 nginx:1.21.6-alpine
# executar usando a porta 8080 (do meu pc) para ( : ) 80 do nginx

# no navegador abrir "http://localhost:8080" então estaremos na tela do nginx
```

#### Os containers não persistem dados
- Quando cria-se um container, após inserimos algum arquivo nele, ao sair o container será encerrado, ao reabrir o container, o arquivo não existirá.
- Se a imagem na qual o container foi criado não contém por padrão persistência de dados habilitada, o conteúdo criado será perdido.

##### Solução:
- Para persistência de dados em containers são os ***volumes*** ou também chamados de ***volumes de dados***

#### Persistência de dados -> _Volumes_
```shell
# rodar container "linux-alpine"
	$ docker run --name linux_alpine --rm -i -t alpine:3.15.0 sh
	
# cria um container com nome "linux_alpine" versão "3.15.0" e execute o shell "sh"

```

#### O que são volumes em um container?
- Volumes são a solução perfeita para nós desenvolvedores, pois se antes por exemplo tínhamos que instalar um servidor web e um banco da dados diretamente na nossa máquina ou criar uma máquina virtual com estes servidores, agora podemos fazer uso de containers, por exemplo, um para servidor web e um para banco de dados, e termos os arquivos de desenvolvimento para trabalho local.
- ***Obs:*** Os arquivos/diretórios expostos estão na sua máquina (host) e não no container. Desta forma qualquer modificação neles a persistência é feita no seu computador e não no container.

#### Criando volumes no Docker
- Primeiramente executando um container em 2 formas:
```shell
# executar um container servidor web nginx, e não mostrar os logs de execução:
	$ docker run --name servidor_web -d -e NGINX_ENTRYPOINT_QUIET=1 nginx:1.21.6
	
# agora executando um containser servidor web, mapeando o diretório fazendo uso de um volume em: "/home/user/volumes_docker/servidor_web/"
	$ docker run -v /home/user/volumes_docker/servidor_web/ --name servidor_web -d -e NGINX_ENTRYPOINT_QUIET=1 nginx:1.21.6
```

- Executando comandos no container em execução:

```shell
# docker executar de forma "iterativa" o "servidor_web" no "shell"
$ docker exec -it servidor_web sh

# acessar então a pasta configurada no volume do container "/home/user/volumes_docker/servidor_web/"

# então agora pode-ser persistir os dados neste diretório.

# após isso, vamos parar o container em execução
$ docker container stop servidor_web

# checar se realmente está encerrado
$ docker ps -a

# vamos executá-lo novamente e testar se o arquivo persitido existe:
$ docker container start servidor_web

# executar shell de forma iterativa novamente:
$ docker exec -it servidor_web sh

# acessar o diretório "/home/user/volumes_docker/servidor_web/"
$ cd /home/user/volumes_docker/servidor_web/

# verá que o arquivo está no mesmo local

```

- ***Obs:***  Conforme o procedimento executado acima, o container não pode ser removido, apenas parado e reiniciado

#### Montagem do volume, especificando _"diretório do container <-> diretório do host"_
```shell
# executar container de --name "servidor_web" -d -p colocando da "porta_8080_localhost:na_Porta_80_do_Container" -e _não_mostrar_logs -v "do_diretórioVolumeDoHost:diretório_Volume_no_container" imagem_nginx:versao-alpine
$ docker run --name "servidor_web" -d -p 8080:80 -e NGINX_ENTRYPOINT_QUIT_LOGS=1 -v "/home/joao/volumes_docker/servidor_web:/usr/share/nginx/html" nginx:1.21.6-alpine-perl
#Obs: diretório informado no container é o padrão quando se usa nginx

# verificar se está rodando:
$ docker ps

# para testar então, vamos acessar no navegador a porta 8080(host) para visualizar a página "index.html" que está em '/usr/share/nginx/html'

# Precisando acessar via shell o volume no container
# docker executar de forma iterativa o "servidor_web" no sh (shell)
$ docker exec -it servidor_web sh
```
- ***Obs.:*** desse modo os dados permanecerão persistidos mesmo se o container for removido
#### Inspecionando um container
- Para visuzliar informações do container, volume, diretório de montagem e etc
```shell
# após exscutar o comando, basta localizar no log o parágrafo "Mounts" irá mostrar: 'Source': diretório do volume no localhost 'Destination': local no container
$ docker inspect 'container_id'
```

```shell
# Visualizar consumo de hardware do container
$ docker stats
```

```shell
```