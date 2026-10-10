/// The authenticated session, persisted locally. Mirrors the legacy
/// $_SESSION fields (user_id/username/full_name/email/auth_time) set on
/// successful login, with the same 24h expiry rule from auth_check.php.
/// OTP verification is not part of this flow — see AuthRepository doc.
class AuthSession {
  const AuthSession({
    required this.userId,
    required this.username,
    required this.fullName,
    required this.email,
    required this.authTime,
  });

  final int userId;
  final String username;
  final String fullName;
  final String email;
  final DateTime authTime;

  static const _sessionLifetime = Duration(hours: 24);

  bool get isValid =>
      DateTime.now().difference(authTime) < _sessionLifetime;

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'username': username,
    'fullName': fullName,
    'email': email,
    'authTime': authTime.toIso8601String(),
  };

  factory AuthSession.fromJson(Map<String, dynamic> json) => AuthSession(
    userId: json['userId'] as int,
    username: json['username'] as String,
    fullName: json['fullName'] as String,
    email: json['email'] as String,
    authTime: DateTime.parse(json['authTime'] as String),
  );
}

class AuthException implements Exception {
  AuthException(this.message);
  final String message;
  @override
  String toString() => message;
}
