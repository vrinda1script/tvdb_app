class CommonApiResponse {
  bool? status;
  String? message;

  CommonApiResponse({
    this.status,
    this.message,
  });

  factory CommonApiResponse.fromJson(Map<String, dynamic> json) =>
      CommonApiResponse(
        status: json["status"],
        message: json["status"]
            ? json["message"]
            : (json["message"]['error'] as List)
                .reduce((value, element) => '$value. $element.'),
      );
}
