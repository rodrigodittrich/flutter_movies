import 'package:flutter/material.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../../domain/entities/movie.dart';
import '../../controllers/movie_controller.dart';
import '../widgets/data_table_widget.dart';

class MoviePage extends StatefulWidget {

  const MoviePage({ super.key });

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final controller = GetIt.I.get<MovieController>();

  @override
  void initState() {
    controller.findAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScopedBuilder<MovieController, List<Movie>>(
        store: controller,
        onLoading: (loading) => const Center(child: CircularProgressIndicator()),
        onError: (_, error) => Text(error.message),
        onState: (_, movies) {
          if(movies.isEmpty)  return const Text('No videos found');
          return DataTableWidget(
            tableTitle: 'List movies',
            columns: columns(), 
            rows: rows(movies)
          );
        }
      ),
    );
  }

  List<DataColumn> columns() {
    return [
      const DataColumn(label: Text('Id')),
      const DataColumn(label: Text('Year')),
      const DataColumn(label: Text('Title')),
      const DataColumn(label: Text('Winner')),
    ];
  }

  List<DataRow> rows(List<Movie> items) {
    return List.generate(items.length, (index) {
      return DataRow(cells: [
        DataCell(Text('${items[index].id}')),
        DataCell(Text('${items[index].year}')),
        DataCell(Text('${items[index].title}')),
        DataCell(Text('${items[index].winner}')),
      ]);
    });
  }
}