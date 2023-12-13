import 'package:flutter/material.dart';
import '../components/movie_min_max_interval_between_wins_component.dart';
import '../components/movie_top_studios_winners_component.dart';
import '../components/movie_winners_year_component.dart';
import '../components/movie_years_multiple_winners_component.dart';
import 'movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter movies', style: TextStyle(color: Colors.white)), 
          backgroundColor: Colors.black
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MovieYearsMultipleWinnersComponent(),
                  MovieTopStudiosWinnersComponent(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MovieMinMaxIntervalBetweenWinsComponent(),
                  MovieWinnersYearComponent(),
                ],
              ),
              MoviePage()
            ],
          ),
        ),
    );
  }
}