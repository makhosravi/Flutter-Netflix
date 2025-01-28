// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SigninReqParams {
  final String email;
  final String password;
  SigninReqParams({
    required this.email,
    required this.password,
  });

  SigninReqParams copyWith({
    String? email,
    String? password,
  }) {
    return SigninReqParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory SigninReqParams.fromMap(Map<String, dynamic> map) {
    return SigninReqParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SigninReqParams.fromJson(String source) => SigninReqParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SigninReqParams(email: $email, password: $password)';

  @override
  bool operator ==(covariant SigninReqParams other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
