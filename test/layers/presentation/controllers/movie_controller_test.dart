import 'package:flutter_movies/src/commons_dependencies/commons_dependencies.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie.dart';
import 'package:flutter_movies/src/layers/domain/usecases/all_movies/all_movies_use_case.dart';
import 'package:flutter_movies/src/layers/presentation/controllers/movie_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movies/src/layers/domain/entities/movie_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'movie_controller_test.mocks.dart';

@GenerateMocks([AllMoviesUseCase])
void main() {
  late MovieController controller;
  final mockAllMoviesUseCase = MockAllMoviesUseCase();
  final MoviePage moviePage = MoviePage(movies: []);

  setUp(() {
    controller = MovieController(mockAllMoviesUseCase);
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