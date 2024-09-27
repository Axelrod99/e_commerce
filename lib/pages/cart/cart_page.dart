import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/pages/homepage/main_page_body.dart';
import 'package:e_commerce/pages/widget/app_icon.dart';
import 'package:e_commerce/routes/route_helper.dart';
import 'package:e_commerce/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/dimensions.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.home);
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    size: 36,
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  size: 36,
                  backgroundColor: Colors.blue,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  size: 36,
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height10),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstant.BASE_URL +
                                        AppConstant.UPLOAD_URL +
                                        cartController.getItems[index].img!),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Expanded(
                                  child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      cartController.getItems[index].name!,
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 22),
                                    ),
                                    Text(
                                      "Spicy",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${cartController.getItems[index].price!}",
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 20),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            top: 6,
                                            bottom: 6,
                                            left: Dimensions.width20,
                                            right: Dimensions.width20,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  // popularProduct.setQuantity(false);
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
                                                // popularProduct.inCartItems.toString(),
                                                '0',
                                                style: TextStyle(
                                                    fontSize:
                                                        Dimensions.height20),
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10 / 2,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // popularProduct.setQuantity(true);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                    );
                  })),
            ),
          )
        ],
      ),
    );
  }
}
