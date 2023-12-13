import 'package:flutter/material.dart';
import '../components/movie_min_max_interval_between_wins_component.dart';
import '../components/movie_top_studios_winners_component.dart';
import '../components/movie_winners_year_component.dart';
import '../components/movie_years_multiple_winners_component.dart';

class DashboardPage extends StatelessWidget {

  const DashboardPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MovieYearsMultipleWinnersComponent(),
              MovieTopStudiosWinnersComponent(),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MovieMinMaxIntervalBetweenWinsComponent(),
              MovieWinnersYearComponent(),
            ],
          ),
        ],
      ),
    );
  }
}