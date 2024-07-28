import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
class ContactModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String address;

  ContactModel({
    required this.name,
    required this.phoneNumber,
    required this.address,
  }) : id = Uuid().v4();

  @override
  bool operator ==(covariant ContactModel other) {
    return identical(this, other) ||
        id == other.id &&
            name == other.name &&
            phoneNumber == other.phoneNumber &&
            address == other.address;
  }

  @override
  int get hashCode => Object.hashAll([id, name, phoneNumber, address]);

  @override
  String toString() {
    return "ContactModel(id:$id, name:$name, phoneNumber:$phoneNumber, address:$address)";
  }
}
