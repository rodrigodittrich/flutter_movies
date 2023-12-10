import '../../domain/entities/movie_page.dart';

abstract interface class MovieDatasource {
  Future<MoviePage> findAll({required Map<String, dynamic> params});
}