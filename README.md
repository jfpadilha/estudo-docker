ESTUDO DOCKER
================================

Estudo em formato prático e objetivo, onde aprendo e demonstro como trabalhar com containers Docker e publicando suas aplicações com eficiência, juntamente com uma notação que poderá servir de manual rápido para o dia a dia.

![](img-docker.png)

********
********
NOTAÇÃO
==========

Básico sobre docker
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