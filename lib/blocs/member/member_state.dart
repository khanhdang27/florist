part of 'member_bloc.dart';

@immutable
abstract class MemberState {}

class MemberInitial extends MemberState {}

class MemberGetOneSuccess extends MemberState{
  final Member item;

  MemberGetOneSuccess({this.item});
}

class MemberGetOneFailed extends MemberState{}

class MemberRegisterSuccess extends MemberState{}
class MemberRegisterFailed extends MemberState{}

class ResetPassSuccess extends MemberState{}
class ResetPassFailed extends MemberState{}

class ForgotPassSuccess extends MemberState{
  final int id;
  final String code;

  ForgotPassSuccess({this.id,this.code});
}
class ForgotPassFailed extends MemberState{}

class CheckExistSuccess extends MemberState{
  final String statusEmail;
  final String statusPhone;

  CheckExistSuccess({this.statusEmail,this.statusPhone});
}
class CheckExistFailed extends MemberState{}