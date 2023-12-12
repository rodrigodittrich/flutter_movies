import 'package:flutter/material.dart';
import '../../../../commons_dependencies/commons_dependencies.dart';
import '../../controllers/movie_controller.dart';

class HomePage extends StatefulWidget {

  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.I.get<MovieController>();

  @override
  void initState() {
    super.initState();
    controller.findAllMovies();
    controller.listYearsWithMultipleWinnersUseCase();
    controller.studiosWithWinCount();
    controller.mimMaxWinInterval();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Flutter movies'),),
           body: Container(),
       );
  }
}