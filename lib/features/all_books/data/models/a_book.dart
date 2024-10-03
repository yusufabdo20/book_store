class ABookModel {
  int? id;
  String? title;
  String? category;
  String? description;
  String? price;
  String? image;

  ABookModel({
    this.id,
    this.title,
    this.category,
    this.description,
    this.price,
    this.image,
  });

  factory ABookModel.fromAtef(Map<String, dynamic> json) => ABookModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        category: json['category'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toAtef() => {
        'id': id,
        'title': title,
        'category': category,
        'description': description,
        'price': price,
        'image': image,
      };
}
