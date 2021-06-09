class AddToCart {
  String text;
  String description;
  String url;

  AddToCart({this.text, this.description, this.url});

  AddToCart.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['description'] = this.description;
    data['url'] = this.url;
    return data;
  }
}