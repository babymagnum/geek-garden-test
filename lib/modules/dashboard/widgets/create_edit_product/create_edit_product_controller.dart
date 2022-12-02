import 'dart:math';
import 'package:geek_garden_test/data/model/response/product_model.dart';
import 'package:geek_garden_test/modules/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class CreateEditProductController extends GetxController {

  late int productId;

  CreateEditProductController(ProductModel? product) {
    if (product == null) return;

    productId = product.id ?? 0;
    productTitle(product.title ?? '');
    productDescription(product.description ?? '');
  }

  final productTitle = ''.obs;
  final productDescription = ''.obs;

  final _dashboardController = Get.find<DashboardController>();

  Map<String, String? Function(dynamic)> get validators => {
    'title': (v) => v.isEmpty ? 'Title kosong*' : null,
    'description': (v) => v == null || v.isEmpty ? 'Deskripsi kosong*' : null,
  };

  bool get disable {
    return productTitle.isEmpty || productDescription.isEmpty;
  }

  void createProduct() {
    _dashboardController.products.insert(0, ProductModel(
      id: _dashboardController.products.length + 1,
      title: productTitle.value,
      description: productDescription.value,
      price: Random().nextDouble() * 120,
      category: 'Telor',
      image: 'https://d3eeke16mv0lt7.cloudfront.net/sites/default/files/styles/article_hero_image/public/field/image/testing-trends-world-quality-report.jpg?itok=vUyONZsj',
      rating: Rating(rate: Random().nextDouble() * 5)
    ));

    Get.back();
  }

  void editProduct() {
    final selectedProduct = _dashboardController.products.indexWhere((element) => element.id == productId);
    final newItem = _dashboardController.products[selectedProduct];
    newItem.title = productTitle.value;
    newItem.description = productDescription.value;

    _dashboardController.products[selectedProduct] = newItem;
    _dashboardController.products.refresh();

    Get.back();
  }
}