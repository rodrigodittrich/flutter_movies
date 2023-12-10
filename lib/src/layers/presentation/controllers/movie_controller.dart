
import '../../domain/entities/movie_page.dart';
import '../../domain/usecases/all_movies/all_movies_use_case.dart';

class MovieController {
  final AllMoviesUseCase _allMoviesUseCase;

  MovieController(this._allMoviesUseCase);

  MoviePage moviePage = MoviePage();

  Future<void> findAllMovies() async {
    final result = await _allMoviesUseCase.call(params: {}); 
    result.fold(
      (success) {
        moviePage = success;
        print(success.movies.length);
      }, 
      (failure) => print(failure)
    );
  }
}