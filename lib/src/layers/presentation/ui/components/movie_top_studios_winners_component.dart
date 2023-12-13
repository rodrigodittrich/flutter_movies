import 'package:flutter/material.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../../domain/entities/movie_studio_winning.dart';
import '../../controllers/movie_top_studios_winners_controller.dart';
import '../widgets/data_table_widget.dart';

class MovieTopStudiosWinnersComponent extends StatefulWidget {

  const MovieTopStudiosWinnersComponent({ super.key });

  @override
  State<MovieTopStudiosWinnersComponent> createState() => _MovieTopStudiosWinnersComponentState();
}

class _MovieTopStudiosWinnersComponentState extends State<MovieTopStudiosWinnersComponent> {
  final controller = GetIt.I.get<MovieTopStudiosWinnersController>();

  @override
  void initState() {
    controller.listOfWinsByStudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MovieTopStudiosWinnersController, List<MovieStudioWinning>>(
      store: controller,
      onLoading: (loading) => const Center(child: CircularProgressIndicator()),
      onError: (_, error) => Text(error.message),
      onState: (_, movieStudioWinnings) {
        if(movieStudioWinnings.isEmpty)  return const Text('There are no top winners');
        return DataTableWidget(
          tableTitle: 'Top 3 studios with winners',
          columns: columns(), 
          rows: rows(movieStudioWinnings)
        );
      }
    );
  }

  List<DataColumn> columns() {
    return [
      const DataColumn(label: Text('Name')),
      const DataColumn(label: Text('Win Count')),
    ];
  }

  List<DataRow> rows(List<MovieStudioWinning> items) {
    return List.generate(items.length, (index) {
      return DataRow(cells: [
        DataCell(Text('${items[index].name}')),
        DataCell(Text('${items[index].winCount}')),
      ]);
    });
  }
}