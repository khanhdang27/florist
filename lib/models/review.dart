import 'package:florist/models/models.dart';

class Review {
  int id;
  String dateCreated;
  String dateCreatedGmt;
  int productId;
  String status;
  String reviewer;
  String reviewerEmail;
  String review;
  int rating;
  bool verified;
  AvatarUrls reviewerAvatarUrls;

  Review(
      {this.id,
        this.dateCreated,
        this.dateCreatedGmt,
        this.productId,
        this.status,
        this.reviewer,
        this.reviewerEmail,
        this.review,
        this.rating,
        this.verified,
        this.reviewerAvatarUrls});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    productId = json['product_id'];
    status = json['status'];
    reviewer = json['reviewer'];
    reviewerEmail = json['reviewer_email'];
    review = json['review'];
    rating = json['rating'];
    verified = json['verified'];
    reviewerAvatarUrls = json['reviewer_avatar_urls'] != null
        ? new AvatarUrls.fromJson(json['reviewer_avatar_urls'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['product_id'] = this.productId;
    data['status'] = this.status;
    data['reviewer'] = this.reviewer;
    data['reviewer_email'] = this.reviewerEmail;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['verified'] = this.verified;
    if (this.reviewerAvatarUrls != null) {
      data['reviewer_avatar_urls'] = this.reviewerAvatarUrls.toJson();
    }
    return data;
  }
}