import '../../../../commons/commons.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_year_winner.dart';
import '../../converter/movie_converter.dart';
import '../../converter/movie_page_converter.dart';
import '../../converter/movie_year_winner_converter.dart';
import '../../dto/movie_dto.dart';
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
}