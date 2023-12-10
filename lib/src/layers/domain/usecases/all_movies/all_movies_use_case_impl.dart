import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie_page.dart';
import '../../exception/movie_exception.dart';
import '../../repositories/movie_repository.dart';
import 'all_movies_use_case.dart';

class AllMoviesUseCaseImpl implements AllMoviesUseCase {
  final MovieRepository _movieRepository;

  AllMoviesUseCaseImpl(this._movieRepository);

  @override
  AsyncResult<MoviePage, MovieException> call({required Map<String, dynamic> params}) async {
    return _movieRepository.findAll(params: params);
  }
}