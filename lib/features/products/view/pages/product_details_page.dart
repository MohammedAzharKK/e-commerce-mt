import 'package:e_ommerce_app/features/products/controller/product_controller.dart';
import 'package:e_ommerce_app/features/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
    required this.availability,
    required this.brand,
    required this.category,
    required this.description,
    required this.discount,
    required this.imageUrl,
    required this.price,
    required this.productName,
    required this.rating,
    required this.reviews,
  });

  final String productName;
  final String brand;
  final String category;
  final double price;
  final double discount;
  final bool availability;
  final double rating;
  final String description;
  final String imageUrl;
  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    final productsController = Get.find<ProductsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              height: 400,
              width: double.infinity,
              child: PageView(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      productName,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$brand - $category',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '\$${(price - (price * discount / 100)).toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "\$${price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.red[300],
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            '10% Discount',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                        'Availability ${availability ? 'In Stock' : 'Out of Stock'}'),
                    const SizedBox(height: 8),
                    Text(
                      ' ${rating.toString()} ★',
                      style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(description),
                    const SizedBox(height: 8),
                    const Text('Customer Reviews',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: .8, color: const Color(0xFFDFDFDF))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'User ${reviews[index].userId}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Text(' ${reviews[index].rating} ',
                                                  style: const TextStyle(
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Transform.translate(
                                                offset: const Offset(0, -1),
                                                child: const Text(
                                                  "★",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.orange),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(reviews[index].comment),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: .5,
                                color: Colors.green.withOpacity(0.5),
                              )),
                          child: Center(
                              child: SvgPicture.asset(
                                  "assets/icons/love-icon.svg",
                                  semanticsLabel: 'Acme Logo')),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
