import 'package:flutter/material.dart';
import 'package:geek_garden_test/data/model/response/product_model.dart';
import 'package:geek_garden_test/modules/dashboard/widgets/create_edit_product/create_edit_product_controller.dart';
import 'package:geek_garden_test/widgets/custom_textbutton.dart';
import 'package:geek_garden_test/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class CreateEditProductDialog extends StatelessWidget {
  final ProductModel? product;

  CreateEditProductDialog({Key? key, this.product}) : super(key: key);

  late CreateEditProductController _controller;
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEditProductController>(
      init: CreateEditProductController(product),
      builder: (controller) {
        _controller = controller;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(product != null ? 'Edit Product' : 'Add Product', style: TextStyle(fontSize: Get.width * 0.04),)),
                            const SizedBox(width: 10,),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(Icons.close, size: Get.width * 0.04,),
                            )
                          ],
                        ).marginSymmetric(horizontal: 16),
                        const SizedBox(height: 16,),
                        const Divider(height: 1, color: Color(0xffE5E5E5),),
                        const SizedBox(height: 16,),
                        Text('Product Title', style: TextStyle(fontSize: Get.width * 0.04),).marginSymmetric(horizontal: 16),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          initialValue: product?.title,
                          inputAction: TextInputAction.done,
                          onEditingComplete: () => FocusScope.of(context).unfocus(),
                          maxLines: 1,
                          hint: 'Input product title',
                          validators: _controller.validators['title'],
                          onChanged: (value) => _controller.productTitle(value.trim()),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xffE5E5E5))),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        ).marginSymmetric(horizontal: 16),
                        const SizedBox(height: 16,),
                        Text('Product Description', style: TextStyle(fontSize: Get.width * 0.04),).marginSymmetric(horizontal: 16),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          initialValue: product?.description,
                          inputAction: TextInputAction.newline,
                          hint: 'Input product description',
                          minLines: null,
                          maxLines: 5,
                          textInputType: TextInputType.multiline,
                          validators: _controller.validators['description'],
                          onChanged: (value) => _controller.productDescription(value.trim()),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xffE5E5E5))),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        ).marginSymmetric(horizontal: 16),
                        const SizedBox(height: 16,),
                        const Divider(height: 1, color: Color(0xffE5E5E5),),
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomTextButton(
                              onPressed: () {
                                if (!(_formState.currentState?.validate() ?? false)) return;

                                if (product == null) {
                                  _controller.createProduct();
                                } else {
                                  _controller.editProduct();
                                }
                              },
                              borderColor: Colors.transparent,
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              buttonColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
                              text: product == null ? 'Create' : 'Save',
                            )
                          ],
                        ).marginSymmetric(horizontal: 16)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
