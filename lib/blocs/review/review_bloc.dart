import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/blocs/app_bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/review_repository.dart';
import 'package:meta/meta.dart';

part 'review_event.dart';

part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewInitial());
  final ReviewRepository reviewRepository = ReviewRepository();

  @override
  Stream<ReviewState> mapEventToState(ReviewEvent event) async* {
    if (event is ReviewGetAll) {
      List<Review> reviews = await reviewRepository.getAll(event.productId);
      if (true) {
        yield ReviewGetAllSuccess(
          items: reviews,
        );
      } else {
        yield ReviewGetAllFailed();
      }
    }
    if (event is ReviewAdd) {
      int stt = await reviewRepository.addReview(
          member_id: event.member_id,
          content: event.content,
          product_id: event.product_id,
      );
      if (stt == 1) {
        yield AddReviewSuccess();
        AppBloc.reviewBloc.add(ReviewGetAll(productId: event.product_id));
      } else {
        yield AddReviewFailed();
      }
    }
  }
}
