import '../../../commons_dependencies/commons_dependencies.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/list_movies_winners_by_year/list_movies_winners_by_year_use_case.dart';

class MovieWinnersYearController extends Store<List<Movie>> {
  final ListMoviesWinnersByYearUseCase _listMoviesWinnersByYearUseCase;

  MovieWinnersYearController(this._listMoviesWinnersByYearUseCase) : super([]);

  void listMoviesWinnersByYear({required int year}) async {
    setLoading(true);
    final result = await _listMoviesWinnersByYearUseCase(year: year); 
    result.fold(
      (success) => update(success),
      (failure) => setError(failure)
    );
    setLoading(false);
  }
}