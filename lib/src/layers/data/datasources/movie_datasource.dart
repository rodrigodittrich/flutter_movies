import '../../domain/entities/movie_page.dart';
import '../../domain/entities/movie_studio_winning.dart';
import '../../domain/entities/movie_win_interval.dart';
import '../../domain/entities/movie_year_winner.dart';

abstract interface class MovieDatasource {
  Future<MoviePage> findAll({required Map<String, dynamic> params});
  Future<List<MovieYearWinner>> findWinnersPerYear({required  String projection});
  Future<List<MovieStudioWinning>> studiosWithWinCount();
  Future<MovieWinInterval> maxMinWinInterval();
}