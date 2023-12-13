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
  List<int> anos = List.generate(75, (index) => 1950 + index);
  int? yearSelected;

  @override
  void initState() {
    controller.listMoviesWinnersByYear(year: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MovieWinnersYearController, List<Movie>>(
      store: controller,
      onLoading: (loading) => const Center(child: CircularProgressIndicator()),
      onError: (_, error) => Text(error.message),
      onState: (_, movies) {
        return Column(
          children: [
            DataTableWidget(
              tableTitle: 'List movie winners by year',
              widget: yearSelect(),
              columns: columns(), 
              rows: rows(movies)
            ),
          ],
        );
      }
    );
  }

  Widget yearSelect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<int>(
          hint: const Text('Search by year'),
          value: yearSelected,
          onChanged: (year) {
            setState(() {
              yearSelected = year;
            });
          },
          items: anos.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ),
        Container(
          color: Colors.blueAccent,
          child: IconButton(
            color: Colors.white,
            onPressed: (){
              controller.listMoviesWinnersByYear(year: yearSelected??0);
            }, 
            icon: const Icon(Icons.search)
          ),
        )
        //const Icon(Icons.search, color: Colors.blueAccent)
      ],
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