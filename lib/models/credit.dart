class Credit {
  int id;
  int memberId;
  String expiry;
  String code;
  String cvv;
  String createdAt;
  String updatedAt;

  Credit(
      {this.id,
        this.memberId,
        this.expiry,
        this.code,
        this.cvv,
        this.createdAt,
        this.updatedAt});

  Credit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    expiry = json['expiry'];
    code = json['code'];
    cvv = json['cvv'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['expiry'] = this.expiry;
    data['code'] = this.code;
    data['cvv'] = this.cvv;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}