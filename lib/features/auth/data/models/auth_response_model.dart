class AuthResponseModel {
  final String? token;
  final String? tokenType;

  AuthResponseModel({this.token, this.tokenType});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'],
      tokenType: json['token_type'],
    );
  }
}
