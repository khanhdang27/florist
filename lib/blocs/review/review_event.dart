part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class ReviewGetAll extends ReviewEvent {
  final int productId;

  ReviewGetAll({this.productId});
}
class ReviewAdd extends ReviewEvent {
  final int member_id;
  final int product_id;
  final String content;

  ReviewAdd({this.member_id, this.product_id, this.content });
}
