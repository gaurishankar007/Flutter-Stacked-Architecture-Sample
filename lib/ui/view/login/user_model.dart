import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  }) : id = const Uuid().v4();

  @override
  bool operator ==(covariant UserModel other) {
    return identical(this, other) ||
        id == other.id &&
            name == other.name &&
            email == other.email &&
            password == other.password;
  }

  @override
  int get hashCode => Object.hashAll([id, name, email, password]);

  @override
  String toString() {
    return "UserModel(id:$id, name:$name, email:$email, password:$password)";
  }
}
