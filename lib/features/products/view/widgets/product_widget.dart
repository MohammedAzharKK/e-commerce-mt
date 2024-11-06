import 'package:e_ommerce_app/features/products/controller/product_controller.dart';
import 'package:e_ommerce_app/features/products/view/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();
    const discountPercentage = 0.1;

    return SizedBox(
        height: 300,
        child: Obx(() {
          if (controller.errorText.value.isNotEmpty) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (controller.isLoaded.value) {
            final products = controller.products.value;

            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final imageUrlIndex = index % controller.iamgeUrls.length;
                  final product = products[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 240,
                      width: 150,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProductDetailsPage(
                                price: product.price,
                                discount: discountPercentage * 100,
                                imageUrl: controller.iamgeUrls[imageUrlIndex],
                                productName: product.name,
                                availability: true,
                                brand: product.brand,
                                category: product.category,
                                description: product.description,
                                rating: product.rating,
                                reviews: product.reviews!,
                              ));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: SizedBox(
                                  height: 150,
                                  child: Stack(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        controller.iamgeUrls[imageUrlIndex],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: 8,
                                      child: Container(
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.red[300],
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    topLeft:
                                                        Radius.circular(10))),
                                        child: const Center(
                                            child: Text(
                                          '10% Discount',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].name,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      products[index].brand,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$ ${products[index].price}',
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '\$ ${(products[index].price - (products[index].price * discountPercentage)).toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Text('${products[index].rating} ⭐'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
