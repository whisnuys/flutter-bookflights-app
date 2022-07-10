import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final int balance;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.balance = 0,
  });

  @override
  List<Object?> get props => [id, email, name, balance];
}
