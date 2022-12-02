import 'package:dartz/dartz.dart';
import 'package:geek_garden_test/data/model/response/product_model.dart';
import 'package:geek_garden_test/data/networking/base_service.dart';
import 'package:get/get.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductModel>>> getAllProduct();
}

class ProductRepositoryImpl extends ProductRepository {

  final _baseService = Get.find<BaseService>();

  @override
  Future<Either<String, List<ProductModel>>> getAllProduct() async {
    final response = await _baseService.getRequest(url: '/products');

    if (response.isOk) {
      final data = response.body as List<dynamic>;
      return Right(data.map((e) => ProductModel.fromJson(e)).toList());
    } else {
      return const Left('Tidak ada data');
    }
  }
}