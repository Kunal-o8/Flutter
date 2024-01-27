class Auth {
  final bool loggedIn;

  Auth({
    required this.loggedIn,
  });
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      loggedIn: json['loggedIn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loggedIn': loggedIn,
    };
  }
}
