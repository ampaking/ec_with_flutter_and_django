class Product {
  int? id;
  String? title;
  String? date;
  String? productPhoto;
  int? originalPrice;
  int? discountPrice;
  String? description;
  Category? category;

  Product(
      {this.id,
      this.title,
      this.date,
      this.productPhoto,
      this.originalPrice,
      this.discountPrice,
      this.description,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    productPhoto = json['product_photo'];
    originalPrice = json['original_price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['product_photo'] = this.productPhoto;
    data['original_price'] = this.originalPrice;
    data['discount_price'] = this.discountPrice;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? createDate;

  Category({this.id, this.categoryName, this.createDate});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['create_date'] = this.createDate;
    return data;
  }
}
