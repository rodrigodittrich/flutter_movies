import 'package:dio/dio.dart';
import '../../layers/data/datasources/movie_datasource.dart';
import '../../layers/data/datasources/remote/movie_datasource_remote_impl.dart';
import '../../layers/data/repositories/movie_repository_impl.dart';
import '../../layers/domain/repositories/movie_repository.dart';
import 'package:get_it/get_it.dart';
import '../../commons/commons.dart';
import '../../layers/domain/usecases/all_movies/all_movies_use_case.dart';
import '../../layers/domain/usecases/all_movies/all_movies_use_case_impl.dart';
import '../../layers/domain/usecases/list_movies_winners_by_year/list_movies_winners_by_year_use_case.dart';
import '../../layers/domain/usecases/list_movies_winners_by_year/list_movies_winners_by_year_use_case_impl.dart';
import '../../layers/domain/usecases/list_of_wins_by_studio/list_of_wins_by_studio_use_case.dart';
import '../../layers/domain/usecases/list_of_wins_by_studio/list_of_wins_by_studio_use_case_impl.dart';
import '../../layers/domain/usecases/list_years_with_multiple_winners/list_years_with_multiple_winners_use_case.dart';
import '../../layers/domain/usecases/list_years_with_multiple_winners/list_years_with_multiple_winners_use_case_impl.dart';
import '../../layers/domain/usecases/min_max_interval_between_wins/min_max_interval_between_wins_use_case.dart';
import '../../layers/domain/usecases/min_max_interval_between_wins/min_max_interval_between_wins_use_case_impl.dart';
import '../../layers/presentation/controllers/movie_controller.dart';

class Inject { 
  static Future<void> init() async {
    final GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<BaseRepository>(() => BaseRepositoryImpl(getIt()));
    getIt.registerLazySingleton<HttpService>(() => DioServiceImpl(getIt()));
    getIt.registerLazySingleton<MovieDatasource>(() => MovieDatasourceRemoteImpl(getIt()));
    getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getIt()));
    getIt.registerLazySingleton<AllMoviesUseCase>(() => AllMoviesUseCaseImpl(getIt()));
    getIt.registerLazySingleton<ListYearsWithMultipleWinnersUseCase>(() => ListYearsWithMultipleWinnersUseCaseImpl(getIt()));
    getIt.registerLazySingleton<ListOfWinsByStudioUseCase>(() => ListOfWinsByStudioUseCaseImpl(getIt()));
    getIt.registerLazySingleton<MinMaxIntervalBetweenWinsUseCase>(() => MinMaxIntervalBetweenWinsUseCaseImpl(getIt()));
    getIt.registerLazySingleton<ListMoviesWinnersByYearUseCase>(() => ListMoviesWinnersByYearUseCaseImpl(getIt()));
    getIt.registerLazySingleton<MovieController>(() => MovieController(
      getIt(), getIt(), getIt(), getIt(), getIt())
    );
  }
}