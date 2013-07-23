# e-DNE Correios

O e-DNE é um banco de dados que contém todos os CEPs do Brasil.

No entanto, essa base é disponibilizada apenas para download. Então criamos uma ferramenta para importar essa base para nosso banco de dados.

### Instalação

Baixe o projeto:
```shell
git clone git@github.com:elo7/edne-correios.git
```

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

Depois de comprar a base [no site dos Correios](http://shopping.correios.com.br/wbm/shopping/script/default.aspx), você terá acesso aos arquivos na área de **Meus Downloads**. 

Os Correios disponibilizam dois tipos de arquivos:

<table>
  <tr>
    <td><strong>e-DNE Básico - Atualizado até dd/mm/yyyy</strong></td>
    <td><strong>Atualização do e-DNE Básico - Até dd/mm/yyyy</strong></td>
  </tr>
  <tr>
    <td>Esse arquivo possui todos os dados do Brasil, atualizados até a data indicada.</td>
    <td>Durante o ano, os Correios disponibilizam atualizações em relação àquela base, mas eles fazem isso nesse outro formato.</td>
    </tr>
</table>

Baixe apenas o arquivo base e o último de atualização.

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

**Pronto!** Agora você tem todas as informações no banco de dados. 

Recomendamos exportar uma versão consolidada dos CEPs para consultas mais rápidas. Utilizamos o seguinte modelo:
```sql
CREATE TABLE `ceps` (
  `cep` varchar(8) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `nome_estado` varchar(255) NOT NULL,
  PRIMARY KEY (`cep`)
);
```
O comando abaixo irá exportar todos os CEPs para esse formato.
```shell
bundle exec rake import:join
```
