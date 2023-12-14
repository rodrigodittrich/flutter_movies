import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../controllers/movie_controller.dart';

class MoviePage extends StatefulWidget {

  const MoviePage({ super.key });

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final controller = GetIt.I.get<MovieController>();
  final yearEditController = TextEditingController();
  List<String> winners = ['Yes/No', 'Yes', 'No'];
  String winSelected = 'Yes/No';

  void setYear(year) {
    setState(() {
      controller.year = int.tryParse(year);
      yearEditController.text = year;
    });
  }

  void setWinner(String? winner) {
    controller.winner = null;
    setState(() {
      winSelected = winner??'Yes/No';
      if(winSelected == 'Yes') controller.winner = true;
      if(winSelected == 'No') controller.winner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AsyncPaginatedDataTable2(
        showFirstLastButtons: true,
        columns: columns, 
        source: MovieDataTableSource(),
        headingRowHeight: 100,
        dataRowHeight: 30,
        border: const TableBorder(
          verticalInside: BorderSide(color: Colors.grey),
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
          left: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.grey)
        ),
      ),
    );
  }
  List<DataColumn> get columns {
    return [
      const DataColumn(label: Text('Id')),
      DataColumn(
        label: Column(
          children: [
            const Text('Year'),
            TextFormField(
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]+')),],
              controller: yearEditController,
              maxLength: 4,
              decoration: const InputDecoration(
                hintText: 'Filter by year',
                counterText: '',
              ),
              onChanged: (value) {
                if(value.isEmpty) setYear(value);
                if(value.length == 4) setYear(value);
              },
            )
          ],
        )
      ),
      const DataColumn(label: Text('Title')),
      DataColumn(
        label: Column(
          children: [
            const Text('Winner'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DropdownButton<String>(
                isExpanded: true,
                value: winSelected,
                onChanged: (year) => setWinner(year),
                items: winners.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ),
          ],
        )
      ),
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
          //color: MaterialStateProperty.all(Colors.grey[300]),
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