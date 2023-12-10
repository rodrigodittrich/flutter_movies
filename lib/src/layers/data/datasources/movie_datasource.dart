import '../../domain/entities/movie_page.dart';
import '../../domain/entities/movie_year_winner.dart';

abstract interface class MovieDatasource {
  Future<MoviePage> findAll({required Map<String, dynamic> params});
  Future<List<MovieYearWinner>> findWinnersPerYear({required  String projection});
}