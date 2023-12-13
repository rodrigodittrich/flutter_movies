import '../../../commons_dependencies/commons_dependencies.dart';
import '../../domain/entities/movie_win_interval.dart';
import '../../domain/usecases/min_max_interval_between_wins/min_max_interval_between_wins_use_case.dart';

class MovieMinMaxIntervalBetweenWinsController extends Store<MovieWinInterval> {
  final MinMaxIntervalBetweenWinsUseCase _maxIntervalBetweenWinsUseCase;

  MovieMinMaxIntervalBetweenWinsController(this._maxIntervalBetweenWinsUseCase) : super(MovieWinInterval());

  void mimMaxWinInterval() async {
    setLoading(true);
    final result = await _maxIntervalBetweenWinsUseCase(); 
    result.fold(
      (success) => update(success), 
      (failure) => setError(failure)
    );
    setLoading(false);
  }
}