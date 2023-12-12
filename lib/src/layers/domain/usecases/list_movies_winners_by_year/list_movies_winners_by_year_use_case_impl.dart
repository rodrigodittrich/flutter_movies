import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../entities/movie.dart';
import '../../exception/movie_exception.dart';
import '../../repositories/movie_repository.dart';
import 'list_movies_winners_by_year_use_case.dart';

class ListMoviesWinnersByYearUseCaseImpl implements ListMoviesWinnersByYearUseCase {
  final MovieRepository _movieRepository;

  ListMoviesWinnersByYearUseCaseImpl(this._movieRepository);

  @override
  AsyncResult<List<Movie>, MovieException> call({required int year}) {
    return _movieRepository.findMoviesByYear(winner: true, year: year);
  }
}