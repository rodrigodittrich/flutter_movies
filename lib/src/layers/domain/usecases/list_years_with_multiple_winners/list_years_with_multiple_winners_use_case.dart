import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie_year_winner.dart';
import '../../exception/movie_exception.dart';

abstract interface class ListYearsWithMultipleWinnersUseCase {
  AsyncResult<List<MovieYearWinner>, MovieException> call();
}