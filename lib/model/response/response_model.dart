enum ResponseModelStatus { init, loading, complete, error }

class ResponseModel {
  final ResponseModelStatus status;
  final dynamic response;

  ResponseModel({this.status, this.response})
      : assert(status != null, response != null);

  ResponseModel copyWith({ResponseModelStatus status, dynamic response}) =>
      ResponseModel(
          status: status ?? this.status, response: response ?? this.response);
}
