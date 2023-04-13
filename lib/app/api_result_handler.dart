abstract class ApiResults {}

class ApiSuccess extends ApiResults {
  dynamic data;
  int? statusCode;

  ApiSuccess(this.data, this.statusCode);
}

class ApiFailure extends ApiResults {
  int code;
  String message;

  ApiFailure(
    this.code,
    this.message,
  );
}
