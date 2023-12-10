class MovieYearWinnerDto {
  int? year;
  int? winnerCount;

  MovieYearWinnerDto({
    this.year,
    this.winnerCount,
  });

  factory MovieYearWinnerDto.fromMap(Map<String, dynamic> map) {
    return MovieYearWinnerDto(
      year: map['year']?.toInt(),
      winnerCount: map['winnerCount']?.toInt(),
    );
  }
}