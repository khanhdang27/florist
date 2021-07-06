part of 'banner_bloc.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerGetAllSuccess extends BannerState{
  final List<Category> items;

  BannerGetAllSuccess({this.items});
}

class BannerGetAllFailed extends BannerState{}

class BannerGetOneSuccess extends BannerState{
  final Category item;

  BannerGetOneSuccess({this.item});
}

class BannerGetOneFailed extends BannerState{}