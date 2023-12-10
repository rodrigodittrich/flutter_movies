
import '../../domain/entities/movie_page.dart';
import '../../domain/usecases/all_movies/all_movies_use_case.dart';
import '../../domain/usecases/list_years_with_multiple_winners/list_years_with_multiple_winners_use_case.dart';

class MovieController {
  final AllMoviesUseCase _allMoviesUseCase;
  final ListYearsWithMultipleWinnersUseCase _listYearsWithMultipleWinnersUseCase;

  MovieController(this._allMoviesUseCase, this._listYearsWithMultipleWinnersUseCase);

  MoviePage moviePage = MoviePage();

  Future<void> findAllMovies() async {
    final result = await _allMoviesUseCase.call(params: {}); 
    result.fold(
      (success) {
        moviePage = success;
        print(success.movies);
      }, 
      (failure) => print(failure)
    );
  }

  Future<void> listYearsWithMultipleWinnersUseCase() async {
    final result = await _listYearsWithMultipleWinnersUseCase(); 
    result.fold(
      (success) {
        print(success);
      }, 
      (failure) => print(failure)
    );
  }
}