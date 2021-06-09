part of 'member_bloc.dart';

@immutable
abstract class MemberEvent {}

class MemberGetOne extends MemberEvent {}

class MemberRegister extends MemberEvent {
  final String name;
  final String phone;
  final String email;
  final String pass;

  MemberRegister({this.name, this.phone, this.email, this.pass});
}

class ForgotPass extends MemberEvent {
  final String email;

  ForgotPass({this.email});
}

class ResetPass extends MemberEvent {
  final int id;
  final String pass;

  ResetPass({this.id, this.pass});
}

class CheckExist extends MemberEvent {
  final String email;
  final String phone;

  CheckExist({this.email, this.phone});
}
