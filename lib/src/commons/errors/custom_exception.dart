class CustomException implements Exception {
  final String title;
  final String message;
  final int statusCode;

  CustomException({required this.title, required this.message, this.statusCode = 200});
}