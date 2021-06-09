part of 'bag_bloc.dart';

@immutable
abstract class BagState extends Equatable {}

class BagInitial extends BagState {
  @override
  List<Object> get props => [];
}

class BagGetOneSuccess extends BagState {
  final Bag bag;
  final int total;
  final String diff;

  BagGetOneSuccess({this.bag, this.total, this.diff = ''});

  @override
  List<Object> get props => [bag, total, diff];
}

class BagGetOneFailed extends BagState {
  @override
  List<Object> get props => [];
}

class UpdateBagSuccess extends BagState{
  @override
  List<Object> get props => [];
}
class UpdateBagFailed extends BagState{
  @override
  List<Object> get props => [];
}