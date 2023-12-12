import 'package:flutter_movies/src/commons_dependencies/commons_dependencies.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie.dart';
import 'package:flutter_movies/src/layers/domain/usecases/all_movies/all_movies_use_case.dart';
import 'package:flutter_movies/src/layers/domain/usecases/list_movies_winners_by_year/list_movies_winners_by_year_use_case.dart';
import 'package:flutter_movies/src/layers/domain/usecases/list_of_wins_by_studio/list_of_wins_by_studio_use_case.dart';
import 'package:flutter_movies/src/layers/domain/usecases/list_years_with_multiple_winners/list_years_with_multiple_winners_use_case.dart';
import 'package:flutter_movies/src/layers/domain/usecases/min_max_interval_between_wins/min_max_interval_between_wins_use_case.dart';
import 'package:flutter_movies/src/layers/presentation/controllers/movie_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'movie_controller_test.mocks.dart';

@GenerateMocks([
  AllMoviesUseCase,
  ListYearsWithMultipleWinnersUseCase,
  ListOfWinsByStudioUseCase,
  MinMaxIntervalBetweenWinsUseCase,
  ListMoviesWinnersByYearUseCase
])
void main() {
  late MovieController controller;
  final mockAllMoviesUseCase = MockAllMoviesUseCase();
  final mockListYearsWithMultipleWinnersUseCase = MockListYearsWithMultipleWinnersUseCase();
  final mockListOfWinsByStudioUseCase = MockListOfWinsByStudioUseCase();
  final mockMinMaxIntervalBetweenWinsUseCase = MockMinMaxIntervalBetweenWinsUseCase();
  final mockListMoviesWinnersByYearUseCase  = MockListMoviesWinnersByYearUseCase();
  final MoviePage moviePage = MoviePage(movies: []);

  setUp(() {
    controller = MovieController(
      mockAllMoviesUseCase, 
      mockListYearsWithMultipleWinnersUseCase, 
      mockListOfWinsByStudioUseCase,
      mockMinMaxIntervalBetweenWinsUseCase,
      mockListMoviesWinnersByYearUseCase
    );
  });

  group('Movie controller:', () {

    test('should return success with a list of 2 films', () async {
      moviePage.movies.add(Movie(id: 1, producers: [], studios: [], title: 'teste', winner: true, year: 2000));
      moviePage.movies.add(Movie(id: 1, producers: [], studios: [], title: 'teste', winner: true, year: 2000));
      when(mockAllMoviesUseCase.call(params: {})).thenAnswer((_) => Future.value(Success(moviePage)));
      
      await controller.findAllMovies();

      expect(controller.moviePage, isInstanceOf<MoviePage>());
      expect(controller.moviePage.movies.length, 2);
    });
  });
}