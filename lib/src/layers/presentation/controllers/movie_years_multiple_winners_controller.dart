import '../../../commons_dependencies/commons_dependencies.dart';
import '../../domain/entities/movie_year_winner.dart';
import '../../domain/usecases/list_years_with_multiple_winners/list_years_with_multiple_winners_use_case.dart';

class MovieYearsMultipleWinnersController extends Store<List<MovieYearWinner>> {
  final ListYearsWithMultipleWinnersUseCase _listYearsWithMultipleWinnersUseCase;
  
  MovieYearsMultipleWinnersController(
    this._listYearsWithMultipleWinnersUseCase,
  ) : super([]);

  Future<void> listYearsWithMultipleWinners() async {
    setLoading(true);
    final result = await _listYearsWithMultipleWinnersUseCase(); 
    result.fold(
      (success) => update(success), 
      (failure) => setError(failure)
    );
    setLoading(false);
  }
}