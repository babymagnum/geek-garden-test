import 'package:flutter/material.dart';
import 'package:geek_garden_test/data/values/enums.dart';
import 'package:geek_garden_test/modules/dashboard/dashboard_controller.dart';
import 'package:geek_garden_test/modules/dashboard/widgets/create_edit_product/create_edit_product_dialog.dart';
import 'package:geek_garden_test/modules/dashboard/widgets/list_product_item.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  Widget _product(context) {
    return Obx(() {
      return controller.productStatus.value == RequestStatus.LOADING ?
      Center(
        child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
        )),
      ) :
      controller.productStatus.value == RequestStatus.ERROR ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => controller.getProduct(),
            child: Icon(Icons.refresh, size: Get.width * 0.06, color: Colors.black45,),
          ),
        ],
      ) :
      controller.products.isEmpty ?
      Center(child: Text('Product kosong', style: TextStyle(fontSize: Get.width * 0.04),)) :
      ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.height * 0.02),
        itemBuilder: (_, index) {
          return ListProductItem(
            product: controller.products[index],
            onEdit: () => Get.dialog(CreateEditProductDialog(product: controller.products[index],)),
            onDelete: () => controller.products.removeAt(index),
          );
        },
        separatorBuilder: (_, __) => Divider(color: Colors.transparent, height: Get.width * 0.02,),
        itemCount: controller.products.length,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Geek Garden Test', style: TextStyle(fontSize: Get.width * 0.055, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          SizedBox(height: Get.width * 0.04,),
          Row(
            children: [
              Expanded(
                child: Text('Product', style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),),
              ),
              TextButton.icon(
                onPressed: () => Get.dialog(CreateEditProductDialog()),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03, vertical: Get.width * 0.03),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  // minimumSize: Size(double.infinity, minimumSize ?? 50),
                ),
                icon: Icon(
                  Icons.add, size: Get.width * 0.045, color: Colors.white,
                ),
                label: Text('Add Product', style: TextStyle(fontSize: Get.width * 0.04, color: Colors.white, fontWeight: FontWeight.w500),),
              )
            ],
          ).marginSymmetric(horizontal: Get.width * 0.04),
          SizedBox(height: Get.width * 0.04,),
          const Divider(height: 1, color: Color(0xffBBBBBB),),
          Expanded(child: _product(context))
        ],
      ),
    );
  }
}
