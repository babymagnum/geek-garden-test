import 'package:geek_garden_test/data/model/response/product_model.dart';
import 'package:geek_garden_test/data/repository/product_repository.dart';
import 'package:geek_garden_test/data/values/enums.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {

  final productStatus = RequestStatus.IDLE.obs;
  final products = <ProductModel>[].obs;

  final _repository = ProductRepositoryImpl();

  void getProduct() async {
    productStatus(RequestStatus.LOADING);
    final data = await _repository.getAllProduct();
    productStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);

    data.fold((l) {
      // Handle error here if needed.
    }, (r) => products.assignAll(r));
  }

  @override
  void onInit() {
    getProduct();

    super.onInit();
  }
}