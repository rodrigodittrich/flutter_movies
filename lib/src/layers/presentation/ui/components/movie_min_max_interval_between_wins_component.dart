import 'package:flutter/material.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../../domain/entities/movie_win_interval.dart';
import '../../../domain/entities/movie_win_min_max_interval.dart';
import '../../controllers/movie_min_max_interval_between_wins_controller.dart';
import '../widgets/data_table_widget.dart';

class MovieMinMaxIntervalBetweenWinsComponent extends StatefulWidget {

  const MovieMinMaxIntervalBetweenWinsComponent({ super.key });

  @override
  State<MovieMinMaxIntervalBetweenWinsComponent> createState() => _MovieMinMaxIntervalBetweenWinsComponentState();
}

class _MovieMinMaxIntervalBetweenWinsComponentState extends State<MovieMinMaxIntervalBetweenWinsComponent> {
  final controller = GetIt.I.get<MovieMinMaxIntervalBetweenWinsController>();

  @override
  void initState() {
    controller.mimMaxWinInterval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MovieMinMaxIntervalBetweenWinsController, MovieWinInterval>(
      store: controller,
      onLoading: (loading) => const Center(child: CircularProgressIndicator()),
      onError: (_, error) => Text(error.message),
      onState: (_, movieWinInterval) {
        if(movieWinInterval.min.isEmpty && movieWinInterval.max.isEmpty)  return const Text('There are no intervals between winners');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Producers with longest and shortest interval betwenn wins', style: TextStyle(fontWeight: FontWeight.bold)),
            DataTableWidget(
              tableTitle: 'Maximun',
              columns: columns(), 
              rows: rows(movieWinInterval.max)
            ),
            DataTableWidget(
              tableTitle: 'Minimun',
              columns: columns(), 
              rows: rows(movieWinInterval.min)
            ),
          ],
        );
      }
    );
  }

  List<DataColumn> columns() {
    return [
      const DataColumn(label: Text('Produce')),
      const DataColumn(label: Text('Interval')),
      const DataColumn(label: Text('Previous Year')),
      const DataColumn(label: Text('Following Year')),
    ];
  }

  List<DataRow> rows(List<MovieWinMinMaxInterval> items) {
    return List.generate(items.length, (index) {
      return DataRow(cells: [
        DataCell(Text(items[index].producer)),
        DataCell(Text('${items[index].interval}')),
        DataCell(Text('${items[index].previousWin}')),
        DataCell(Text('${items[index].followingWin}')),
      ]);
    });
  }
}