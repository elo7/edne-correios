# e-DNE Correios

O e-DNE é um banco de dados que contém todos os CEPs do Brasil.

No entanto, essa base é disponibilizada apenas para download. Então criamos uma ferramenta para importar essa base para nosso banco de dados.

### Instalação

Baixe as dependências do projeto:

```shell
bundle install
```

### Preparando o banco de dados

Primeiramente vamos importar as informações dos Correios em um banco de dados temporário.

No arquivo `config/database.rb` você encontra as configurações de usuário, senha e banco de dados (MySQL ou SQLite).

Execute o comando abaixo para criar a estrutura básica das tabelas:

```shell
bundle exec rake db:migrate
```

### Baixando os arquivos dos Correios

Depois de comprar a base [nos sites dos Correios](http://shopping.correios.com.br/wbm/shopping/script/default.aspx), você terá acesso aos arquivos na área de **Meus Downloads**. 

Os Correios disponibilizam dois tipos de arquivos:

<table>
  <tr>
    <td><strong>e-DNE Básico - Atualizado até dd/mm/yyyy</strong></td>
    <td><strong>Atualização do e-DNE Básico - Até dd/mm/yyyy</strong></td>
  </tr>
  <tr>
    <td>Esse arquivo possui todos os dados do Brasil, atualizados até a data indicada.</td>
    <td>Durante o ano, os Correios disponibilizam atualizações em relação aquela base, mas eles fazem isso nesse outro formato.</td>
    </tr>
</table>

Baixe apenas o arquivo base e a último de atualização.

### Preparando os arquivos

Coloque os arquivos dentro das pastas designadas no projeto `edne-correios`.


```shell
mv eDNE_Basico_ddmm/Delimitado/LOG* edne-correios/data/log/
mv eDNE_Delta_Basico_ddmm/Delimitado/DELTA* edne-correios/data/delta/
```

### Importação

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


