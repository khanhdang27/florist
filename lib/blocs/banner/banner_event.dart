part of 'banner_bloc.dart';

@immutable
abstract class BannerEvent {}

class BannerGetAll extends BannerEvent {}

class BannerGetOne extends BannerEvent {
  final int Id;

  BannerGetOne({this.Id});
}
