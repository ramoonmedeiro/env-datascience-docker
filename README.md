# Utilizar Contêineres?

Um profissional da área de dados precisa de um ambiente de trabalho para poder executar suas análises. Claro que pode-se fazer isso localmente, já que alguns programas são leves (pandas, numpy, sklearn e etc.). Porém, para trabalhos mais robustos, que utilizam processos ETL ou ELT, com o Apache Airflow ou o EventBridge (AWS) como orquestradores, onde tem passos que utilizam banco de dados e outros serviços que compôem toda a estrutra do pipeline de dados, a criação de contêineres com a ferramenta Docker, fornece uma solução eficiente e organizada para o tratamento de cada serviço. 

Neste repositório eu apresento uma imagem simples criada por mim que contém alguns dos principais programas que todo cientista de dados já utilizou ou pelo menos usou alguns deles. Para executar os passos abaixo, é necessário ter o docker instalado na máquina: <a href="https://www.docker.com/products/docker-desktop/">Download Docker</a>.

# DockerHub e Docker Pull

O (<a href="https://hub.docker.com/">DockerHub</a>) é uma espécie de github só que para o armazenamento e gereciamento de imagens docker. Meu perfil no DockerHub pode ser encontrado <a href="https://hub.docker.com/u/ramonmedeiro">aqui</a>. 

Para baixar a imagem, deve-se executar o seguinte comando no terminal:

```
$ docker pull ramonmedeiro/ds-image
```

Aguardar que a imagem será baixada. São cerca de 3.8 GB.

# Criar Contêiner

Para criar um contêiner com a imagem baixada, basta executar o seguinte comando:

```
$ docker container run -it --rm ramonmedeiro/ds-image
```
Após isso, o seu terminal terá acesso ao contêiner via bash.

# Especificações

O Dockerfile da imagem criada pode ser encotrada acima, onde possuem todas as especificações do contêiner quando o mesmo for criado.

```
* Especificações *

SO: Ubuntu 20.04 LTS
Pacotes DS: Python3, Pandas, NumPy, Matplotlib, Seaborn, SciPy, Scikit-Learn, Tensorflow e Jupyter.
```

# Criar a Própria Imagem

Quem desejar utilizar o docker como criador de ambientes para DS, fiquem à vontade para colocar pacotes da sua necessidade ou adicionar versões específicas para cada programa apenas alterando o arquivo Dockerfile deste repositório. Para isso, é só baixar o Dockerfile diretamente ou clonar este repositório:

```
$ git clone https://github.com/ramoonmedeiro/env-datascience-docker.git
```

Ao ter alterado o arquivo Dockerfile com os pacotes de seu desejo, basta criar a imagem e executar o contêiner localmente:

```
$ docker build -t <nome-da-imagem-escolhida>
$ docker container run -it --rm <nome-da-imagem-escolhida>
```

# Considerações Finais

Para este repositório, optei por não instalar o Anaconda ou Miniconda, pois os mesmos são bem grandes em memória, mas instalar um deles é uma boa prática, já que diversos programas já vem com eles ou podem ser instalados facilmente com o conda.

Para alterar o arquivo Dockerfile, é necessário ter um conhecimento de comandos bash. Há diversos tutoriais na internet muito bons explciando os principais comandos em bash. Pra quem já tem uma certa familiaridade e nunca mexeu com docker, divirta-se na execução dos comandos.
