# Descrição do projeto

Lista de indicados e vencedores da categoria Pior Filme do Golden Raspberry Awards.

Aplicação composta em um Dashboard e uma lista de filmes.

### Dashboard
- Tabela de anos com mais de um vencedor;
- Tabela com o 3 estúdos com mais vitórias;
- Tabela com produtores com maior e menor intervalo entre vitórias;
- Tabela com os vencedores através de um ano selecionado;

### Lista de Filmes
- Lista de filmes com o id, ano, título e vencedor do filme com opção para filtrar por ano e por vencedor;

# Especificações técnicas do projeto;

### Packages utilizados
- **dio:** Pacote usado para realizar as requisições HTTP consumindo a API utilizada;
- **get_it:** Pacote utilizado para fazer as injeções de dependências para usar cada instância quando necessário;
- **result_dart:** Este pacote foi utilizado para implementar no repository múltiplos retornos (Sucesso ou Erro) evitando a utilização do try/cath;
- **flutter_triple:** Este pacote foi utilizado para fazer a gerência de estado no DashBoard;
- **data_table_2:** Este pacote foi utilizada para usar o AsyncPaginatedDataTable2 que facilita a paginação e busca das informação em cada troca de página;

### Arquitetura utilizada
Foi optado para uzar **clean architecture | clean Dart** conforme o modelo que segue.
<div align="center">

![clean_dart](https://github.com/rodrigodittrich/flutter_movies/assets/21061418/56536e61-ece9-4625-bb9f-812ad1894f5b)

</div>

# Plataforma de testes
Apesar de ser um projeto para multilataforma, a parte da visualização do dashboard e da lista de vídeos, é mais adaptável para a plataforma web. Para a plataformar mobile, precisa fazer uma adapção na visualização.

# Exemplo de utilização da aplicação
<div align="center">

![clean_dart](https://github.com/rodrigodittrich/flutter_movies/blob/main/docs/movies_dashboard_list.gif)

</div>

# Executar o projeto
- Baixe o projeto do repositório: **git clone https://github.com/rodrigodittrich/flutter_movies.git**
- Abra o projeto no <a href="https://code.visualstudio.com/download">VSCode</a> ou no editor de sua preferência.
- Execute o projeto no Chrome: **flutter run -d chrome**
- Caso deseje executar em outra plataforma, verifique a lista de dispositivos disponíveis através do comando **flutter devices**
