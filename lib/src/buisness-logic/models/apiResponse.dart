class ApiResponse<T>{
  final T? data;
  final int statusCode;
  final String message;
  final bool success;

  ApiResponse(this.data, this.statusCode, this.message, this.success);

}