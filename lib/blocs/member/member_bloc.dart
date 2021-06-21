import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/member_repository.dart';
import 'package:meta/meta.dart';

part 'member_event.dart';

part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(MemberInitial());
  final MemberRepository memberRepository = MemberRepository();

  @override
  Stream<MemberState> mapEventToState(
    MemberEvent event,
  ) async* {
    if (event is MemberGetOne) {
      Member member = await memberRepository.getOne();
      if (true) {
        yield MemberGetOneSuccess(
          item: member,
        );
      }
    }

    if (event is MemberRegister) {
      int status = await memberRepository.memberRegister(
          name: event.name,
          email: event.email,
          pass: event.pass);
      if (status == 200) {
        yield MemberRegisterSuccess();
      } else {
        yield MemberRegisterFailed();
      }
    }

    if (event is ForgotPass) {
      Map result = await memberRepository.forgotPass(email: event.email);
      if (result['code'] != 'error') {
        yield ForgotPassSuccess(
          code: result['code'],
          id: result['id'],
        );
      } else {
        yield ForgotPassFailed();
      }
    }

    if (event is ResetPass) {
      int result = await memberRepository.resetPass(pass: event.pass,id: event.id);
      if (result == 1) {
        yield ForgotPassSuccess();
      } else {
        yield ForgotPassFailed();
      }
    }

    if (event is CheckExist) {
      yield MemberInitial();
      Map result = await memberRepository.checkExist(email: event.email, phone: event.phone);
      if (result['status_email']!=null) {
        yield CheckExistSuccess(
          statusEmail: result['status_email'],
          statusPhone: result['status_phone'],
        );
      } else {
        yield CheckExistFailed();
      }
    }
  }
}
