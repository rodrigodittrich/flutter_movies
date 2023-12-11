class MovieStudioWinningDto {
  String? name;
  int? winCount;

  MovieStudioWinningDto({
    this.name,
    this.winCount,
  });

  factory MovieStudioWinningDto.fromMap(Map<String, dynamic> map) {
    return MovieStudioWinningDto(
      name: map['name'],
      winCount: map['winCount']?.toInt(),
    );
  }
}