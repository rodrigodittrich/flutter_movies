import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie.dart';
import '../../exception/movie_exception.dart';

abstract interface class ListMoviesWinnersByYearUseCase {
  AsyncResult<List<Movie>, MovieException> call({required int year});
}