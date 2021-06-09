part of 'banner_bloc.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerGetAllSuccess extends BannerState{
  final List<BannerDB> items;

  BannerGetAllSuccess({this.items});
}

class BannerGetAllFailed extends BannerState{}

class BannerGetOneSuccess extends BannerState{
  final BannerDB item;

  BannerGetOneSuccess({this.item});
}

class BannerGetOneFailed extends BannerState{}