// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupReqParams {
  final String email;
  final String password;
  SignupReqParams({
    required this.email,
    required this.password,
  });

  SignupReqParams copyWith({
    String? email,
    String? password,
  }) {
    return SignupReqParams(
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

  factory SignupReqParams.fromMap(Map<String, dynamic> map) {
    return SignupReqParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupReqParams.fromJson(String source) => SignupReqParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SignupReqParams(email: $email, password: $password)';

  @override
  bool operator ==(covariant SignupReqParams other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
