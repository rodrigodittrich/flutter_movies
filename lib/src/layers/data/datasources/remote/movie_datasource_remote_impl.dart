import '../../../../commons/commons.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_studio_winning.dart';
import '../../../domain/entities/movie_win_interval.dart';
import '../../../domain/entities/movie_year_winner.dart';
import '../../converter/movie_converter.dart';
import '../../converter/movie_page_converter.dart';
import '../../converter/movie_studio_winning_converter.dart';
import '../../converter/movie_win_interval_converter.dart';
import '../../converter/movie_year_winner_converter.dart';
import '../../dto/movie_dto.dart';
import '../../dto/movie_studio_winning_dto.dart';
import '../../dto/movie_win_interval_dto.dart';
import '../../dto/movie_year_winner_dto.dart';
import '../movie_datasource.dart';
import '../../../domain/entities/movie_page.dart';

class MovieDatasourceRemoteImpl implements MovieDatasource {
  final BaseRepository _baseRepository;

  MovieDatasourceRemoteImpl(this._baseRepository);

  final baseUrl = 'https://tools.texoit.com/backend-java/api';

  @override
  Future<MoviePage> findAll({required Map<String, dynamic> params}) async { 
    final PageConverter pageConverter = MoviePageConverter();
    final Converter converter = MovieConverter();
    final endPoint = '$baseUrl/movies?page=0&size=10&year=2019';
    final response = await _baseRepository.get(endPoint: endPoint);
    final MoviePage moviePage = pageConverter.createEntity(Page.fromMap(response));
    moviePage.movies = List<Movie>.from(response['content'].map((x) => converter.createEntity(MovieDto.fromMap(x))));
    return moviePage;
  }

  @override
  Future<List<MovieYearWinner>> findWinnersPerYear({required String projection}) async {
    final List<MovieYearWinner> years = [];
    final Converter converter = MovieYearWinnerConverter();
    final endPoint = '$baseUrl/movies?projection=$projection';
    final response = await _baseRepository.get(endPoint: endPoint);
    response['years'].map((value) => years.add(converter.createEntity(MovieYearWinnerDto.fromMap(value)))).toList();
    return years;
  }

  @override
  Future<List<MovieStudioWinning>> studiosWithWinCount() async {
    final List<MovieStudioWinning> studioWinnings = [];
    final Converter converter = MovieStudioWinningConverter();
    final endPoint = '$baseUrl/movies?projection=studios-with-win-count';
    final response = await _baseRepository.get(endPoint: endPoint);
    response['studios'].map((value) => studioWinnings.add(converter.createEntity(MovieStudioWinningDto.fromMap(value)))).toList();
    return studioWinnings;
  }

  @override
  Future<MovieWinInterval> maxMinWinInterval() async {
    MovieWinInterval movieWinInterval = MovieWinInterval(min: [], max: []);
    final Converter converter = MovieWinIntervalConverter();
    final endPoint = '$baseUrl/movies?projection=max-min-win-interval-for-producers';
    final response = await _baseRepository.get(endPoint: endPoint);
    movieWinInterval = converter.createEntity(MovieWinIntervalDto.fromMap(response));
    return movieWinInterval;
  }
  
  @override
  Future<List<Movie>> findMoviesByYear({required bool winner, required int year}) async {
    List<Movie> movies = [];
    final Converter converter = MovieConverter();
    final endPoint = '$baseUrl/movies?winner=$winner&year=$year';
    final response = await _baseRepository.get(endPoint: endPoint);
    movies = List<Movie>.from(response.map((movie) => converter.createEntity(MovieDto.fromMap(movie))));
    return movies;
  }
}