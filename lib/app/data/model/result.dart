class Result<T> {
  int? resultCode;
  String? resultMessage;
  T? data;

  Result({this.resultCode, this.resultMessage, this.data});

  factory Result.fromJson(Map<String, dynamic> json, T? data) => Result(
    resultCode: json['resultCode'],
    resultMessage: json['resultMessage'],
    data: data,
  );

  Map<String, dynamic> toJson() => {
    'resultCode': resultCode,
    'resultMessage': resultMessage,
    'data': data,
  };
}
