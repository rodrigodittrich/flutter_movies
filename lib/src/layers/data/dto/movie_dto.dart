class MovieDto {
  int? id;
  int? year;
  String? title;
  List<String>? studios;
  List<String>? producers;
  bool? winner;

  MovieDto({
    this.id,
    this.year,
    this.title,
    this.studios,
    this.producers,
    this.winner,
  });

  factory MovieDto.fromMap(Map<String, dynamic> map) {
    return MovieDto(
      id: map['id']?.toInt(),
      year: map['year']?.toInt(),
      title: map['title'],
      studios: List<String>.from(map['studios']),
      producers: List<String>.from(map['producers']),
      winner: map['winner'],
    );
  }
}