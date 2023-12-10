import '../../../../commons/commons.dart';
import '../../../domain/entities/movie.dart';
import '../../converter/movie_converter.dart';
import '../../converter/movie_page_converter.dart';
import '../../dto/movie_dto.dart';
import '../movie_datasource.dart';
import '../../../domain/entities/movie_page.dart';

class MovieDatasourceRemoteImpl implements MovieDatasource {
  final BaseRepository _baseRepository;

  MovieDatasourceRemoteImpl(this._baseRepository);

  @override
  Future<MoviePage> findAll({required Map<String, dynamic> params}) async {
    final PageConverter pageConverter = MoviePageConverter();
    final Converter converter = MovieConverter();
    const endPoint = 'https://tools.texoit.com/backend-java/api/movies?page=0&size=10&year=2019';
    final response = await _baseRepository.get(endPoint: endPoint);
    final MoviePage moviePage = pageConverter.createEntity(Page.fromMap(response));
    moviePage.movies = List<Movie>.from(response['content'].map((x) => converter.createEntity(MovieDto.fromMap(x))));
    return moviePage;
  }
}