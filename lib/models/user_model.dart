class UserModel {
  final String id;
  final String nickname;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.nickname,
    required this.email,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nickname: map['nickname'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
      'email': email,
      'password': password,
    };
  }
}
