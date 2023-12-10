import '../entities/movie_page.dart';
import '../entities/movie_year_winner.dart';
import '../exception/movie_exception.dart';
import '../../../commons_dependencies/commons_dependencies.dart';

abstract interface class MovieRepository {
  AsyncResult<MoviePage, MovieException> findAll({required Map<String, dynamic> params});
  AsyncResult<List<MovieYearWinner>, MovieException> findWinnersPerYear({required  String projection});
}