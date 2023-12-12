class MovieWinMinMaxIntervalDto {
  String producer;
  int interval;
  int previousWin;
  int followingWin;

  MovieWinMinMaxIntervalDto({
    this.producer = '',
    this.interval = 0,
    this.previousWin = 0,
    this.followingWin = 0,
  });

  factory MovieWinMinMaxIntervalDto.fromMap(Map<String, dynamic> map) {
    return MovieWinMinMaxIntervalDto(
      producer: map['producer'],
      interval: map['interval']?.toInt(),
      previousWin: map['previousWin']?.toInt(),
      followingWin: map['followingWin']?.toInt(),
    );
  }
}