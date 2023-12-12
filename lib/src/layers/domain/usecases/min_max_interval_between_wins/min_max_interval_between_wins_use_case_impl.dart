
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie_win_interval.dart';
import '../../exception/movie_exception.dart';
import '../../repositories/movie_repository.dart';
import 'min_max_interval_between_wins_use_case.dart';

class MinMaxIntervalBetweenWinsUseCaseImpl implements MinMaxIntervalBetweenWinsUseCase {
  final MovieRepository _movieRepository;

  MinMaxIntervalBetweenWinsUseCaseImpl(this._movieRepository);

  @override
  AsyncResult<MovieWinInterval, MovieException> call() {
    return _movieRepository.maxMinWinInterval();
  }
}