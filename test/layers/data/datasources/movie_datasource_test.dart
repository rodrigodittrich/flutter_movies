import 'dart:convert';
import 'package:flutter_movies/src/commons/commons.dart';
import 'package:flutter_movies/src/layers/data/datasources/movie_datasource.dart';
import 'package:flutter_movies/src/layers/data/datasources/remote/movie_datasource_remote_impl.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie_page.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie_year_winner.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'movie_datasource_test.mocks.dart';
import 'package:mockito/mockito.dart';


@GenerateMocks([BaseRepository])
void main() {
  late MovieDatasource movieDatasource;
  final mockBaseRepository = MockBaseRepository();
  const baseUrl = 'https://tools.texoit.com/backend-java/api';

  setUp(() {
    movieDatasource = MovieDatasourceRemoteImpl(mockBaseRepository);
  });

  group('Movie datasource:', () { 

    test('Must return an instance of the MoviePage', () async {
      const endPoint = '$baseUrl/movies?page=0&size=10&year=2019';
      when(mockBaseRepository.get(endPoint: endPoint)).thenAnswer((_) => Future.value(jsonDecode(json)));
      
      final result = await movieDatasource.findAll(params: {});

      expect(result, isInstanceOf<MoviePage>());
      expect(result.movies.length, 5);
    });

    test('Must return an list of List<MovieYearWinner> with 3 records', () async {
      const endPoint = '$baseUrl/movies?projection=years-with-multiple-winners';
      when(mockBaseRepository.get(endPoint: endPoint)).thenAnswer((_) => Future.value(jsonDecode(jsonWinnersPerYear)));
      
      final result = await movieDatasource.findWinnersPerYear(projection: 'years-with-multiple-winners');

      expect(result, isInstanceOf<List<MovieYearWinner>>());
      expect(result.length, 3);
    });
  });
}

const json = '''
  {
      "content": [
          {
              "id": 202,
              "year": 2019,
              "title": "Cats",
              "studios": [
                  "Universal Pictures"
              ],
              "producers": [
                  "Debra Hayward",
                  "Eric Fellner",
                  "Tim Bevan",
                  "and Tom Hooper"
              ],
              "winner": true
          },
          {
              "id": 203,
              "year": 2019,
              "title": "The Fanatic",
              "studios": [
                  "Quiver Distribution"
              ],
              "producers": [
                  "Daniel Grodnik",
                  "Oscar Generale",
                  "and Bill Kenwright"
              ],
              "winner": false
          },
          {
              "id": 204,
              "year": 2019,
              "title": "The Haunting of Sharon Tate",
              "studios": [
                  "Saban Films"
              ],
              "producers": [
                  "Daniel Farrands",
                  "Lucas Jarach",
                  "and Eric Brenner"
              ],
              "winner": false
          },
          {
              "id": 205,
              "year": 2019,
              "title": "A Madea Family Funeral",
              "studios": [
                  "Lionsgate"
              ],
              "producers": [
                  "Ozzie Areu",
                  "Will Areu",
                  "and Mark E. Swinton"
              ],
              "winner": false
          },
          {
              "id": 206,
              "year": 2019,
              "title": "Rambo: Last Blood",
              "studios": [
                  "Lionsgate"
              ],
              "producers": [
                  "Avi Lerner",
                  "Kevin King Templeton",
                  "Yariv Lerner",
                  "and Les Weldon"
              ],
              "winner": false
          }
      ],
      "pageable": {
          "sort": {
              "unsorted": true,
              "sorted": false,
              "empty": true
          },
          "offset": 0,
          "pageSize": 10,
          "pageNumber": 0,
          "unpaged": false,
          "paged": true
      },
      "last": true,
      "totalPages": 1,
      "totalElements": 5,
      "size": 10,
      "number": 0,
      "sort": {
          "unsorted": true,
          "sorted": false,
          "empty": true
      },
      "first": true,
      "numberOfElements": 5,
      "empty": false
  }
''';


const jsonWinnersPerYear = '''
  {
      "years": [
          {
              "year": 1986,
              "winnerCount": 2
          },
          {
              "year": 1990,
              "winnerCount": 2
          },
          {
              "year": 2015,
              "winnerCount": 2
          }
      ]
  }''';