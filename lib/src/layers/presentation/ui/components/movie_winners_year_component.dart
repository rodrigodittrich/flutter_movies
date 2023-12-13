import 'package:flutter/material.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../../domain/entities/movie.dart';
import '../../controllers/movie_winners_year_controller.dart';
import '../widgets/data_table_widget.dart';

class MovieWinnersYearComponent extends StatefulWidget {

  const MovieWinnersYearComponent({ super.key });

  @override
  State<MovieWinnersYearComponent> createState() => _MovieWinnersYearComponentState();
}

class _MovieWinnersYearComponentState extends State<MovieWinnersYearComponent> {
  final controller = GetIt.I.get<MovieWinnersYearController>();

  @override
  void initState() {
    controller.listMoviesWinnersByYear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MovieWinnersYearController, List<Movie>>(
      store: controller,
      onLoading: (loading) => const Center(child: CircularProgressIndicator()),
      onError: (_, error) => Text(error.message),
      onState: (_, movies) {
        if(movies.isEmpty)  return const Text('There are no winners by year');
        return DataTableWidget(
          tableTitle: 'List years with multiple winners',
          columns: columns(), 
          rows: rows(movies)
        );
      }
    );
  }

  List<DataColumn> columns() {
    return [
      const DataColumn(label: Text('Id')),
      const DataColumn(label: Text('Year')),
      const DataColumn(label: Text('Title')),
    ];
  }

  List<DataRow> rows(List<Movie> items) {
    return List.generate(items.length, (index) {
      return DataRow(cells: [
        DataCell(Text('${items[index].id}')),
        DataCell(Text('${items[index].year}')),
        DataCell(Text('${items[index].title}')),
      ]);
    });
  }
}