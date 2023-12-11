import '../../domain/entities/movie_page.dart';
import '../../domain/entities/movie_studio_winning.dart';
import '../../domain/usecases/all_movies/all_movies_use_case.dart';
import '../../domain/usecases/list_of_wins_by_studio/list_of_wins_by_studio_use_case.dart';
import '../../domain/usecases/list_years_with_multiple_winners/list_years_with_multiple_winners_use_case.dart';

class MovieController {
  final AllMoviesUseCase _allMoviesUseCase;
  final ListYearsWithMultipleWinnersUseCase _listYearsWithMultipleWinnersUseCase;
  final ListOfWinsByStudioUseCase _listOfWinsByStudioUseCase;

  MovieController(
    this._allMoviesUseCase, 
    this._listYearsWithMultipleWinnersUseCase,
    this._listOfWinsByStudioUseCase
  );

  MoviePage moviePage = MoviePage();

  List<MovieStudioWinning> studioWinnings = [];

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

  Future<void> studiosWithWinCount() async {
    final result = await _listOfWinsByStudioUseCase(); 
    result.fold(
      (success) {
        studioWinnings.addAll(success);
        topStudiosWithWinners();
      }, 
      (failure) => print(failure)
    );
  }

  void topStudiosWithWinners() {
    studioWinnings.sort((a, b) => b.winCount!.compareTo(a.winCount!));
    final topX = studioWinnings.sublist(0, 3);
    for(var r in topX) print(r.winCount);
  }
}