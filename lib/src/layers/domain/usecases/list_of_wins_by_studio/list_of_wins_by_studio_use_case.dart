import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie_studio_winning.dart';
import '../../exception/movie_exception.dart';

abstract interface class ListOfWinsByStudioUseCase {
  AsyncResult<List<MovieStudioWinning>, MovieException> call();
}