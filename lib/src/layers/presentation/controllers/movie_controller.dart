import '../../../commons_dependencies/commons_dependencies.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_page.dart';
import '../../domain/usecases/all_movies/all_movies_use_case.dart';
import '../params/movie_params.dart';

class MovieController extends Store<List<Movie>> {
  final AllMoviesUseCase _allMoviesUseCase;

  MovieController(this._allMoviesUseCase) : super([]);

  MoviePage moviePage = MoviePage();

  Future<MoviePage> findAllMovies({required int page, int? year}) async {
    final MovieParams params = MovieParams(page: page, year: year);
    setLoading(true);
    final result = await _allMoviesUseCase.call(params: params.toMap()); 
    result.fold(
      (success) => moviePage = success, 
      (failure) => setError(failure)
    );
    setLoading(false);
    return moviePage;
  }
}