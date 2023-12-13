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

# Especificações téncicas do projeto;

### Packages utilizados
- **dio:** Pacote usado para realizar as requisições HTTP consumindo a API utilizada;
- **get_it:** Pacote utilizado para fazer as injeções de dependências para usar cada instância quando necessário;
- **result_dart:** Este pacote foi utilizado para implementar no repository múltiplos retornos (Sucesso ou Erro) evitando a utilização do try/cath;
- **flutter_triple:** Este pacote foi utilizado para fazer a gerência de estado no DashBoard;
- **data_table_2:** Este pacote foi utilizada para usar o AsyncPaginatedDataTable2 que facilita a paginação e busca das informação em cada troca de página;
