import 'package:frontend_idemusistemsinergi/website/model/product.dart';
import 'package:frontend_idemusistemsinergi/website/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> product = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    product.assignAll(ProductData.productData);
  }
}