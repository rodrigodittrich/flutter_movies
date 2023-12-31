import '../entities/movie.dart';
import '../entities/movie_page.dart';
import '../entities/movie_studio_winning.dart';
import '../entities/movie_win_interval.dart';
import '../entities/movie_year_winner.dart';
import '../exception/movie_exception.dart';
import '../../../commons_dependencies/commons_dependencies.dart';

abstract interface class MovieRepository {
  AsyncResult<MoviePage, MovieException> findAll({required Map<String, dynamic> params});
  AsyncResult<List<MovieYearWinner>, MovieException> yearsWithMultipleWinners({required  String projection});
  AsyncResult<List<MovieStudioWinning>, MovieException> studiosWithWinCount();
  AsyncResult<MovieWinInterval, MovieException> maxMinWinInterval();
  AsyncResult<List<Movie>, MovieException> findMoviesByYear({required bool winner, required int year});
}