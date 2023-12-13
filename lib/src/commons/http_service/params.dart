class Params {
  int page;
  int size;

  Params({
    this.page = 0,
    this.size = 10,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'size': size,
    };
  }
}