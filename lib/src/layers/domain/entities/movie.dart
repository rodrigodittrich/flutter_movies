class Movie {
  int? id;
  int? year;
  String? title;
  List<String>? studios;
  List<String>? producers;
  bool? winner;

  Movie({
    this.id,
    this.year,
    this.title,
    this.studios,
    this.producers,
    this.winner,
  });
}