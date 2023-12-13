import 'package:flutter/material.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../controllers/movie_controller.dart';

class MoviePage extends StatefulWidget {

  const MoviePage({ super.key });

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return AsyncPaginatedDataTable2(
      showFirstLastButtons: true,
      columns: columns, 
      source: MovieDataTableSource()
    );
  }
  List<DataColumn> get columns {
    return [
      const DataColumn(label: Text('Id')),
      const DataColumn(label: Text('Year')),
      const DataColumn(label: Text('Title')),
      const DataColumn(label: Text('Winner')),
    ];
  }
}

class MovieDataTableSource extends AsyncDataTableSource {
  final controller = GetIt.I.get<MovieController>();

  MovieDataTableSource();
  
  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    final index = startIndex;
    assert(index >= 0);
    final moviePage = await controller.findAllMovies(page: (startIndex / count).ceil());
    final movies = moviePage.movies;
    final row = AsyncRowsResponse(
      movies.isEmpty ? 0 : moviePage.totalElements??0,
      movies.map((movie) {
        return DataRow(
          cells: [
            DataCell(Text('${movie.id}')),
            DataCell(Text('${movie.year}')),
            DataCell(Text('${movie.title}')),
            DataCell(Text('${movie.winner}')),
          ],
        );
      }).toList());
    return row;
  }
}