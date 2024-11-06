import 'package:e_ommerce_app/features/products/model/product_model.dart';
import 'package:e_ommerce_app/features/products/services/product_services.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoaded = false.obs;
  var errorText = ''.obs;

  var iamgeUrls = [
    'https://welpix.b-cdn.net/wp-content/uploads/2024/03/Significance-of-electronic-product-photography.webp',
    'https://welpix.b-cdn.net/wp-content/uploads/2024/03/The-art-of-storytelling-in-electronic-product-photography.webp',
    'https://welpix.b-cdn.net/wp-content/uploads/2024/03/A-complete-guide-about-editorial-product-photography-1-1536x876.webp',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3RpCB4z-2uV2NRPV4yO8MgbTzRptQYRhS_Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwIdeGSfrM_Ds_0hMFXTndBPpKsyjCN00MYg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX-yfpG82pZPUtS87iynnNSqsUaqJy03mG8w&s',
  ].obs;

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoaded.value = false;

      products.assignAll(
        await ProductServices.fetchProducts(),
      );

      isLoaded.value = true;
    } catch (e) {
      errorText.value = 'Failed to get products. Try again ';

      Get.snackbar(
          'Cannot get products', 'Please check your internet connection');
    }
  }
}
