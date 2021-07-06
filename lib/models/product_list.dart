class ProductList {
  String name;
  String slug;
  String description;
  String price;
  String regularPrice;
  String salePrice;
  String image;

  ProductList(
      {this.name,
      this.slug,
      this.description,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.image});

  ProductList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['image'] = this.image;
    return data;
  }
}
