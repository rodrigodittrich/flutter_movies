import 'package:flutter/material.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../../domain/entities/movie_year_winner.dart';
import '../../controllers/movie_years_multiple_winners_controller.dart';
import '../widgets/data_table_widget.dart';

class MovieYearsMultipleWinnersComponent extends StatefulWidget {

  const MovieYearsMultipleWinnersComponent({super.key});

  @override
  State<MovieYearsMultipleWinnersComponent> createState() => _MovieYearsMultipleWinnersComponentState();
}

class _MovieYearsMultipleWinnersComponentState extends State<MovieYearsMultipleWinnersComponent> {
  final controller = GetIt.I.get<MovieYearsMultipleWinnersController>();

  @override
  void initState() {
    controller.listYearsWithMultipleWinners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MovieYearsMultipleWinnersController, List<MovieYearWinner>>(
      store: controller,
      onLoading: (loading) => const Center(child: CircularProgressIndicator()),
      onError: (_, error) => Text(error.message),
      onState: (_, movieYearsWinner) {
        if(movieYearsWinner.isEmpty)  return const Text('Não existem vencedores');
        return DataTableWidget(
          tableTitle: 'List years with multiple winners',
          columns: columns(), 
          rows: rows(movieYearsWinner)
        );
      }
    );
  }

  List<DataColumn> columns() {
    return [
      const DataColumn(label: Text('Year')),
      const DataColumn(label: Text('Win Count')),
    ];
  }

  List<DataRow> rows(List<MovieYearWinner> items) {
    return List.generate(items.length, (index) {
      return DataRow(cells: [
        DataCell(Text('${items[index].year}')),
        DataCell(Text('${items[index].winnerCount}')),
      ]);
    });
  }
}