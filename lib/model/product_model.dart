class ProductModel{
 String? id;
  String? title;
  String? description;
  String? category;
  int? price;
  String? image;

  ProductModel(
      {this.title,
      this.id,
      this.description,
      this.image,
      this.price,
      this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    image = json['image'];
  }

// it's not using in project
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      '_id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'image': image,
    };
    return data;
  }

}