import '../../../commons_dependencies/commons_dependencies.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/all_movies/all_movies_use_case.dart';

class MovieController extends Store<List<Movie>> {
  final AllMoviesUseCase _allMoviesUseCase;

  MovieController(this._allMoviesUseCase) : super([]);

  List<Movie> movies = [];

  Future<void> findAllMovies() async {
    setLoading(true);
    final result = await _allMoviesUseCase.call(params: {}); 
    result.fold(
      (success) {
        movies.addAll(success.movies);
        update(movies);
      }, 
      (failure) => setError(failure)
    );
    setLoading(false);
  }
}