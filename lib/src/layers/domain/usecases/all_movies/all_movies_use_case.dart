import '../../entities/movie_page.dart';
import '../../exception/movie_exception.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';

abstract interface class AllMoviesUseCase {
  AsyncResult<MoviePage, MovieException> call({required Map<String, dynamic> params});
}