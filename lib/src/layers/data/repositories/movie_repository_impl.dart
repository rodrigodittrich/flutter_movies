import '../../../commons/commons.dart';
import '../../../commons_dependencies/commons_dependencies.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_studio_winning.dart';
import '../../domain/entities/movie_win_interval.dart';
import '../../domain/entities/movie_year_winner.dart';
import '../datasources/movie_datasource.dart';
import '../../domain/entities/movie_page.dart';
import '../../domain/exception/movie_exception.dart';
import '../../domain/repositories/movie_repository.dart';
import 'package:result_dart/result_dart.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource _movieDatasource;

  MovieRepositoryImpl(this._movieDatasource);

  @override
  AsyncResult<MoviePage, MovieException> findAll({required Map<String, dynamic> params}) async {
    try {
      return Success(await _movieDatasource.findAll(params: params));
    } on CustomException catch (e) {
      throw Failure(MovieException(title: e.title, message: e.message));
    }
  }

  @override
  AsyncResult<List<MovieYearWinner>, MovieException> findWinnersPerYear({required String projection}) async {
    try {
      return Success(await _movieDatasource.findWinnersPerYear(projection: projection));
    } on CustomException catch (e) {
      throw Failure(MovieException(title: e.title, message: e.message));
    }
  }

  @override
  AsyncResult<List<MovieStudioWinning>, MovieException> studiosWithWinCount() async {
    try {
      return Success(await _movieDatasource.studiosWithWinCount());
    } on CustomException catch (e) {
      throw Failure(MovieException(title: e.title, message: e.message));
    }
  }

  @override
  AsyncResult<MovieWinInterval, MovieException> maxMinWinInterval() async {
    try {
      return Success(await _movieDatasource.maxMinWinInterval());
    } on CustomException catch (e) {
      throw Failure(MovieException(title: e.title, message: e.message));
    }
  }

  @override
  AsyncResult<List<Movie>, MovieException> findMoviesByYear({required bool winner, required int year}) async {
    try {
      return Success(await _movieDatasource.findMoviesByYear(winner: winner, year: year));
    } on CustomException catch (e) {
      throw Failure(MovieException(title: e.title, message: e.message));
    }
  }
}