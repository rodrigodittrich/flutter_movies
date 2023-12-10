import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie_year_winner.dart';
import '../../exception/movie_exception.dart';
import '../../repositories/movie_repository.dart';
import 'list_years_with_multiple_winners_use_case.dart';

class ListYearsWithMultipleWinnersUseCaseImpl implements ListYearsWithMultipleWinnersUseCase {
  final MovieRepository _movieRepository;

  ListYearsWithMultipleWinnersUseCaseImpl(this._movieRepository);
 
  @override
  AsyncResult<List<MovieYearWinner>, MovieException> call() {
    return _movieRepository.findWinnersPerYear(projection: 'years-with-multiple-winners');
  }
}