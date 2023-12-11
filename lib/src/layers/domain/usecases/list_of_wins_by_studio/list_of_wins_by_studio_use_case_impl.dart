import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie_studio_winning.dart';
import '../../exception/movie_exception.dart';
import '../../repositories/movie_repository.dart';
import 'list_of_wins_by_studio_use_case.dart';

class ListOfWinsByStudioUseCaseImpl implements ListOfWinsByStudioUseCase {
  final MovieRepository _movieRepository;

  ListOfWinsByStudioUseCaseImpl(this._movieRepository);

  @override
  AsyncResult<List<MovieStudioWinning>, MovieException> call() {
    return _movieRepository.studiosWithWinCount();
  }
}