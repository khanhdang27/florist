import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/banner_repository.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial());
  final BannerRepository bannerRepository = BannerRepository();

  @override
  Stream<BannerState> mapEventToState(BannerEvent event) async* {
    if (event is BannerGetAll) {
      List<BannerDB> banners = await bannerRepository.getAll();
      if (true) {
        yield BannerGetAllSuccess(
          items: banners,
        );
      } else {
        yield BannerGetAllFailed();
      }
    }

    if (event is BannerGetOne) {
      BannerDB banner = await bannerRepository.getOne(Id: event.Id);
      if (true) {
        yield BannerGetOneSuccess(
          item: banner,
        );
      } else {
        yield BannerGetOneFailed();
      }
    }
  }
}
