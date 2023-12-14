import 'package:flutter/material.dart';
import '../../../../commons/commons.dart';
import '../components/movie_min_max_interval_between_wins_component.dart';
import '../components/movie_top_studios_winners_component.dart';
import '../components/movie_winners_year_component.dart';
import '../components/movie_years_multiple_winners_component.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: context.percentWidth(.4), 
                child: const MovieYearsMultipleWinnersComponent()
              ),
              SizedBox(
                width: context.percentWidth(.4), 
                child: const MovieTopStudiosWinnersComponent()
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: context.percentWidth(.4), 
                child: const MovieMinMaxIntervalBetweenWinsComponent()
              ),
              SizedBox(
                width: context.percentWidth(.4),
                child: const MovieWinnersYearComponent(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}