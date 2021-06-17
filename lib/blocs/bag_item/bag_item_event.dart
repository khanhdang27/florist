part of 'bag_item_bloc.dart';

@immutable
abstract class BagItemEvent {}

class ResetBagItem extends BagItemEvent{}

class AddBagItem extends BagItemEvent {
  final int productId;
  final int quantity;

  AddBagItem({this.productId, this.quantity});
}

class AddAllBagItem extends BagItemEvent {
  final int bagId;
  final int wishlistId;

  AddAllBagItem({this.bagId, this.wishlistId});
}

class BagChangeQuantity extends BagItemEvent {
  final int quantity;
  final String key;

  BagChangeQuantity({this.quantity, this.key});
}

class BagDeleteItem extends BagItemEvent {
  final String key;

  BagDeleteItem({this.key});
}
