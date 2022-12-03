import 'package:flutter/material.dart';
import 'package:geek_garden_test/data/model/response/product_model.dart';
import 'package:get/get.dart';

class ListProductItem extends StatelessWidget {
  final ProductModel product;
  final Function() onDelete;
  final Function() onEdit;

  const ListProductItem({Key? key, required this.product, required this.onDelete, required this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 6), blurRadius: 10, spreadRadius: 0)
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
                child: Image.network(product.image ?? '', width: Get.width * 0.2, height: Get.height * 0.2, fit: BoxFit.contain,),
              ),
              Positioned(
                top: 0, left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01, vertical: Get.width * 0.01),
                  transform: Matrix4.translationValues(-(Get.width * .03), 0, 0.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(6), topLeft: Radius.circular(6))
                  ),
                  child: Text('\$ ${'${product.price}'}', style: TextStyle(fontSize: Get.width * 0.03, color: Colors.white, fontWeight: FontWeight.w800),),
                ),
              )
            ],
          ),
          SizedBox(width: Get.width * 0.03,),
          Expanded(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title ?? '', style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold),),
                    SizedBox(height: Get.width * 0.015,),
                    Text(product.description ?? '', maxLines: 4, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: Get.width * 0.03, fontWeight: FontWeight.normal),),
                    SizedBox(height: Get.width * 0.02,),
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            width: Get.width * 0.06, height: Get.width * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Icon(Icons.delete_forever, color: Colors.white, size: Get.width * 0.04,),
                          ),
                          onTap: () => onDelete(),
                        ),
                        SizedBox(width: Get.width * 0.02,),
                        InkWell(
                          onTap: () => onEdit(),
                          child: Container(
                            width: Get.width * 0.06, height: Get.width * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Icon(Icons.edit_outlined, color: Colors.white, size: Get.width * 0.04,),
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                              children: [
                                WidgetSpan(child: Icon(Icons.star, size: Get.width * 0.035,).marginOnly(right: Get.width * 0.01, bottom: 1)),
                                TextSpan(
                                    text: '${product.rating?.rate}'.substring(0, '${product.rating?.rate}'.length > 3 ? 3 : '${product.rating?.rate}'.length),
                                    style: TextStyle(fontSize: Get.width * 0.035, color: Colors.black, fontWeight: FontWeight.w600)
                                )
                              ]
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ).paddingSymmetric(vertical: Get.width * 0.02),
          ),
        ],
      ),
    );
  }
}
