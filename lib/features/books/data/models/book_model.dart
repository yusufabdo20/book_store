import 'package:equatable/equatable.dart';

class BookModel {
  final int? id;
  final String? title;
  final String? category;
  final String? description;
  final String? price;
  final String? image;

  const BookModel({
    this.id,
    this.title,
    this.category,
    this.description,
    this.price,
    this.image,
  });

  factory BookModel.fromAtef(Map<String, dynamic> json) => BookModel(
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

  @override
  List<Object?> get props {
    return [
      id,
      title,
      category,
      description,
      price,
      image,
    ];
  }
}
