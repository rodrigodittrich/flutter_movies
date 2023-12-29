import 'dart:convert';
import 'package:flutter_movies/src/commons/commons.dart';
import 'package:flutter_movies/src/layers/data/datasources/movie_datasource.dart';
import 'package:flutter_movies/src/layers/data/datasources/remote/movie_datasource_remote_impl.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie_page.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie_studio_winning.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie_win_interval.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie_win_min_max_interval.dart';
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
      final Map<String, dynamic> params = {
        'page': 0,
        'size': 10,
        'year': 2019,
        'winner': true
      };
      const endPoint = '$baseUrl/movies?page=0&size=10&year=2019&winner=true';
      when(mockBaseRepository.get(endPoint: endPoint)).thenAnswer((_) => Future.value(jsonDecode(json)));
  
      final result = await movieDatasource.findAll(params: params);

      expect(result, isInstanceOf<MoviePage>());
      expect(result.movies.length, 5);
    });

    test('Must return an list of List<MovieYearWinner> with 3 records', () async {
      const endPoint = '$baseUrl/movies?projection=years-with-multiple-winners';
      when(mockBaseRepository.get(endPoint: endPoint)).thenAnswer((_) => Future.value(jsonDecode(jsonWinnersPerYear)));
      
      final result = await movieDatasource.yearsWithMultipleWinners(projection: 'years-with-multiple-winners');

      expect(result, isInstanceOf<List<MovieYearWinner>>());
      expect(result.length, 3);
    });

    test('Must return an list of List<MovieStudioWinning> with 3 records', () async {
      const endPoint = '$baseUrl/movies?projection=studios-with-win-count';
      when(mockBaseRepository.get(endPoint: endPoint)).thenAnswer((_) => Future.value(jsonDecode(jsonStudioWinning)));
      
      final result = await movieDatasource.studiosWithWinCount();

      expect(result, isInstanceOf<List<MovieStudioWinning>>());
      expect(result.length, 28);
    });

    test('Must return an instance of the MovieWinInterval', () async {
      const endPoint = '$baseUrl/movies?projection=max-min-win-interval-for-producers';
      when(mockBaseRepository.get(endPoint: endPoint)).thenAnswer((_) => Future.value(jsonDecode(jsonWinInterval)));
      
      final result = await movieDatasource.maxMinWinInterval();

      expect(result, isInstanceOf<MovieWinInterval>());
      expect(result.min, isInstanceOf<List<MovieWinMinMaxInterval>>());
      expect(result.max, isInstanceOf<List<MovieWinMinMaxInterval>>());
      expect(result.min.length, 1);
      expect(result.max.length, 1);
    });

    test('Must return an list of List<Movie> with 1 record', () async {
      const winner = true;
      const year = 2018;
      const endPoint = '$baseUrl/movies?winner=$winner&year=$year';
      when(mockBaseRepository.get(endPoint: endPoint)).thenAnswer((_) => Future.value(jsonDecode(jsonMovies)));
      
      final result = await movieDatasource.findMoviesByYear(winner: true, year: 2018);

      expect(result, isInstanceOf<List<Movie>>());
      expect(result.length, 1);
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

const jsonStudioWinning = '''
  {
      "studios": [
          {
              "name": "Columbia Pictures",
              "winCount": 7
          },
          {
              "name": "Paramount Pictures",
              "winCount": 6
          },
          {
              "name": "Warner Bros.",
              "winCount": 5
          },
          {
              "name": "20th Century Fox",
              "winCount": 4
          },
          {
              "name": "MGM",
              "winCount": 3
          },
          {
              "name": "Universal Studios",
              "winCount": 2
          },
          {
              "name": "Universal Pictures",
              "winCount": 2
          },
          {
              "name": "Hollywood Pictures",
              "winCount": 2
          },
          {
              "name": "Nickelodeon Movies",
              "winCount": 1
          },
          {
              "name": "C2 Pictures",
              "winCount": 1
          },
          {
              "name": "Summit Entertainment",
              "winCount": 1
          },
          {
              "name": "Hasbro",
              "winCount": 1
          },
          {
              "name": "Associated Film Distribution",
              "winCount": 1
          },
          {
              "name": "Revolution Studios",
              "winCount": 1
          },
          {
              "name": "First Look Pictures",
              "winCount": 1
          },
          {
              "name": "Focus Features",
              "winCount": 1
          },
          {
              "name": "Cannon Films",
              "winCount": 1
          },
          {
              "name": "United Artists",
              "winCount": 1
          },
          {
              "name": "Touchstone Pictures",
              "winCount": 1
          },
          {
              "name": "Samuel Goldwyn Films",
              "winCount": 1
          },
          {
              "name": "Quality Flix",
              "winCount": 1
          },
          {
              "name": "TriStar Pictures",
              "winCount": 1
          },
          {
              "name": "Franchise Pictures",
              "winCount": 1
          },
          {
              "name": "Relativity Media",
              "winCount": 1
          },
          {
              "name": "Castle Rock Entertainment",
              "winCount": 1
          },
          {
              "name": "Screen Gems",
              "winCount": 1
          },
          {
              "name": "Triumph Releasing",
              "winCount": 1
          },
          {
              "name": "DreamWorks",
              "winCount": 1
          }
      ]
  }''';

const jsonWinInterval = '''
  {
      "min": [
          {
              "producer": "Joel Silver",
              "interval": 1,
              "previousWin": 1990,
              "followingWin": 1991
          }
      ],
      "max": [
          {
              "producer": "Matthew Vaughn",
              "interval": 13,
              "previousWin": 2002,
              "followingWin": 2015
          }
      ]
  }''';

const jsonMovies = '''
  [
      {
          "id": 197,
          "year": 2018,
          "title": "Holmes & Watson",
          "studios": [
              "Columbia Pictures"
          ],
          "producers": [
              "Adam McKay",
              "Clayton Townsend",
              "Jimmy Miller",
              "Will Ferrell"
          ],
          "winner": true
      }
  ]''';