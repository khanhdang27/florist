part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class ReviewGetAll extends ReviewEvent {
  final int productId;

  ReviewGetAll({this.productId});
}
class ReviewAdd extends ReviewEvent {
  final int memberId;
  final int productId;
  final String content;

  ReviewAdd({this.memberId, this.productId, this.content });
}
