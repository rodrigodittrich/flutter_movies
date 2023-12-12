import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie_win_interval.dart';
import '../../exception/movie_exception.dart';

abstract interface class MinMaxIntervalBetweenWinsUseCase {
  AsyncResult<MovieWinInterval, MovieException> call();
}