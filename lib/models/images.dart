// class Images {
//   int id;
//   String dateCreated;
//   String dateCreatedGmt;
//   String dateModified;
//   String dateModifiedGmt;
//   String src;
//   String name;
//   String alt;
//
//   Images(
//       {this.id,
//         this.dateCreated,
//         this.dateCreatedGmt,
//         this.dateModified,
//         this.dateModifiedGmt,
//         this.src,
//         this.name,
//         this.alt});
//
//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     dateCreated = json['date_created'];
//     dateCreatedGmt = json['date_created_gmt'];
//     dateModified = json['date_modified'];
//     dateModifiedGmt = json['date_modified_gmt'];
//     src = json['src'];
//     name = json['name'];
//     alt = json['alt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['date_created'] = this.dateCreated;
//     data['date_created_gmt'] = this.dateCreatedGmt;
//     data['date_modified'] = this.dateModified;
//     data['date_modified_gmt'] = this.dateModifiedGmt;
//     data['src'] = this.src;
//     data['name'] = this.name;
//     data['alt'] = this.alt;
//     return data;
//   }
// }

class Images {
  int id;
  String src;
  String thumbnail;
  String srcset;
  String sizes;
  String name;
  String alt;

  Images(
      {this.id,
        this.src,
        this.thumbnail,
        this.srcset,
        this.sizes,
        this.name,
        this.alt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
    thumbnail = json['thumbnail'];
    srcset = json['srcset'];
    sizes = json['sizes'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['src'] = this.src;
    data['thumbnail'] = this.thumbnail;
    data['srcset'] = this.srcset;
    data['sizes'] = this.sizes;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}