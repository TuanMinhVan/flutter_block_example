import '../../data/models/model_user.dart';

abstract class AuthEvent {}

class OnAuthCheck extends AuthEvent {}

class OnAuthProcess extends AuthEvent {
  OnAuthProcess({required this.user});
  final UserModel user;
}

class OnClear extends AuthEvent {}
