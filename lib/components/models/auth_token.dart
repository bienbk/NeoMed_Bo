class AuthToken {
  int id;
  String token;
  int userId;
  String refreshToken;

  AuthToken({
    required this.id,
    required this.token,
    required this.userId,
    required this.refreshToken,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      id: json['ID'],
      token: json['Token'],
      userId: json['UserId'],
      refreshToken: json['RefreshToken'],
    );
  }
}
