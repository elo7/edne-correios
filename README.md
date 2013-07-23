# e-DNE Correios

O e-DNE, é um banco de dados que contém mais de 900 mil CEP de todo o Brasil, constituído de elementos de endereçamento (descrição de logradouros, bairros, municípios, vilas, povoados) e Códigos de Endereçamento Postal - CEP. É a base oficial e exclusiva dos Correios, sendo assim, a informação é confiável e atualizada.

## Instalação
Essa ferramenta foi desenvolvida usando Ruby 1.9, verifique que você possui essa versão usando `ruby -v`. 
Caso possua uma outra versão, recomendamos a instalação via [RVM](https://rvm.io/), pela praticidade.

Assim que estiver com a versão de Ruby correta, instale o Bundler caso não tenha: `gem install bundler`.

Baixe as dependências do projeto:

```shell
bundle install
```

## Preparando o banco de dados temporário

### Se você prefere usar MySQL
Crie um banco local chamado `edne-correios` e configure o usuario e senha no arquivo `config/database.rb`. 

### Se você prefere usar SQLite
Troque as linhas do arquivo `config/database.rb`.


```shell
bundle exec rake db:migrate
```

## Preparando os arquivos dos Correios

Depois de comprar a base [nos sites dos Correios](http://shopping.correios.com.br/wbm/shopping/script/default.aspx), vá para a área de *Meus Downloads*:

![](http://f.cl.ly/items/0M213M0D1V2O0a0r2K1m/Screen%20Shot%202013-07-23%20at%201.33.14%20PM.png)

Baixe apenas os arquivos que forem necessários. Como podemos ver na página, precisamos apenas de:
- e-DNE Básico - Atualizado até 14/04/2013
- Atualização do e-DNE Básico - Até 14/06/2013

Coloque os arquivos no lugar certo:
```shell
mv eDNE_Basico_ddmm/Delimitado/LOG* edne-correios/data/log/
mv eDNE_Delta_Basico_ddmm/Delimitado/DELTA* edne-correios/data/delta
```

## Importação e Exportação

Importe a base e o delta:
```shell
bundle exec rake import:base
bundle exec rake import:delta
```

Se você quiser exportar uma versão consolidada do CEP para consultas rápidas, execute:
```shell
bundle exec rake import:join
```

Isso é recomendado para agilizar a consulta de CEPs.


