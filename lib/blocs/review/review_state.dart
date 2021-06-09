part of 'review_bloc.dart';

@immutable
abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewGetAllSuccess extends ReviewState{
  final List<Review> items;

  ReviewGetAllSuccess({this.items});
}

class ReviewGetAllFailed extends ReviewState{}

class AddReviewSuccess extends ReviewState{}
class AddReviewFailed extends ReviewState{}