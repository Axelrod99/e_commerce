import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/dimensions.dart';
import 'package:e_commerce/pages/widget/app_column.dart';
import 'package:e_commerce/pages/widget/app_icon.dart';
import 'package:e_commerce/pages/widget/extendable_text_widget.dart';
import 'package:e_commerce/routes/route_helper.dart';
import 'package:e_commerce/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
  PopularFoodDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(AppConstant.BASE_URL +
                      AppConstant.UPLOAD_URL +
                      product.img!),
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.home);
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                // AppIcon(icon: Icons.shopping_cart_checkout_outlined)
                // GetBuilder<PopularProductController>(
                //   builder: (controller) {
                //     return Stack(
                //       children: [
                //         AppIcon(icon: Icons.shopping_cart_outlined),
                //         Get.find<PopularProductController>().totalItems >= 1
                //             ? Positioned(
                //                 right: 0,
                //                 top: 0,
                //                 child: AppIcon(
                //                   icon: Icons.circle,
                //                   size: 20,
                //                   iconColor: Colors.blue,
                //                   backgroundColor: Colors.transparent,
                //                 ),
                //               )
                //             : Container(),
                //         Get.find<PopularProductController>().totalItems >= 1
                //             ? Positioned(
                //                 right: 3,
                //                 top: 3,
                //                 child: Text(
                //                   Get.find<PopularProductController>()
                //                       .totalItems
                //                       .toString(),
                //                   style: TextStyle(
                //                       fontSize: 20, color: Colors.white),
                //                 ),
                //               )
                //             : Container()
                //       ],
                //     );
                //   },
                // )

                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getCart());
                          },
                          child: AppIcon(icon: Icons.shopping_cart_outlined),
                        ),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: -5,
                                top: -5,
                                child: Container(
                                  // Wrap the text and center it
                                  alignment: Alignment.center,
                                  child: Text(
                                    Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  // Set a minimum size and adjust padding based on font size
                                  padding: const EdgeInsets.all(8.0),
                                  // height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              height: 395,
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: product.name!,
                  ),
                  SizedBox(height: Dimensions.height20),
                  Text(
                    'Introduction',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExtendableTextWidget(
                        text: product.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    Text(
                      popularProduct.inCartItems.toString(),
                      style: TextStyle(fontSize: Dimensions.height20),
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: Text(
                    '\$ ${product.price!} | Add to cart',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.blue[200],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
