// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: (json['productId'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      unit: json['unit'] as String,
      image: json['image'] as String,
      discount: (json['discount'] as num).toInt(),
      availability: json['availability'] as bool,
      brand: json['brand'] as String,
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'unit': instance.unit,
      'image': instance.image,
      'discount': instance.discount,
      'availability': instance.availability,
      'brand': instance.brand,
      'category': instance.category,
      'rating': instance.rating,
      'reviews': instance.reviews,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      userId: (json['userId'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'userId': instance.userId,
      'rating': instance.rating,
      'comment': instance.comment,
    };
