import 'package:e_ommerce_app/features/products/controller/product_controller.dart';
import 'package:e_ommerce_app/features/products/view/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  ///the [location] variable value can be get by using location packkages
  final String location = "Cyber park,Calicut";
  @override
  Widget build(BuildContext context) {
    ///controller to get products
    final productsController = Get.put(ProductsController());

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const SizedBox(
                  width: 300,
                  child: SearchBar(
                    leading: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.search)),
                    hintText: 'Search',
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications))
              ]),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                  ),
                  const Text(
                    "Deliver to ",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "New Arrivals",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const ProductWidget(),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Trending products",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const ProductWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
