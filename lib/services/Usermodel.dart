class Usermodel {
  Usermodel({
    required this.username,
    required this.password,
    required this.sessionId,
  });
  late final String username;
  late final String password;
  late final String sessionId;

  Usermodel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = this.username;
    _data['password'] = this.password;
    _data['session_id'] = this.sessionId;
    return _data;
  }
}
