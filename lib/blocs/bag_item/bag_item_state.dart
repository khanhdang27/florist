part of 'bag_item_bloc.dart';

@immutable
abstract class BagItemState {}

class BagItemInitial extends BagItemState {}

class AddBagItemSuccess extends BagItemState{}
class AddBagItemFailed extends BagItemState{}

class AddAllBagItemSuccess extends BagItemState{}
class AddAllBagItemFailed extends BagItemState{}

class BagChangeQuantitySuccess extends BagItemState{
  final int total;

  BagChangeQuantitySuccess({this.total});
}
class BagChangeQuantityFailed extends BagItemState{}

class BagDeleteItemSuccess extends BagItemState{
  final Bag bag;

  BagDeleteItemSuccess({this.bag});
}
class BagDeleteItemFailed extends BagItemState{}