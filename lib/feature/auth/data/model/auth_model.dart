class AuthModel {
  final String id;
  final String email;
  final String password;
  final String token;
  AuthModel({
    required this.id,
    required this.email,
    required this.password,
    required this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }
}
