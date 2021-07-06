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
      List<Category> banners = await bannerRepository.getAll();
      if (true) {
        yield BannerGetAllSuccess(
          items: banners,
        );
      }
    }

    if (event is BannerGetOne) {
      Category banner = await bannerRepository.getOne(id: event.id);
      if (true) {
        yield BannerGetOneSuccess(
          item: banner,
        );
      }
    }
  }
}
