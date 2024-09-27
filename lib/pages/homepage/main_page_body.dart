import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/controllers/recommended_product_controller.dart';
import 'package:e_commerce/models/products_models.dart';
import 'package:e_commerce/pages/popular_food_details.dart';
import 'package:e_commerce/pages/widget/icon_and_text_widget.dart';
import 'package:e_commerce/routes/route_helper.dart';
import 'package:e_commerce/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/dimensions.dart';
import 'package:get/get.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewTextContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print('current value + $_currPageValue');
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? Container(
                    height: Dimensions.pageView,
                    color: Colors.grey[100],
                    // child: GestureDetector(
                    //   onTap: () {
                    //     Get.toNamed(RouteHelper.getPopularFood());
                    //   },
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                            position,
                            _currPageValue.floor(),
                            _scaleFactor,
                            _height,
                            popularProducts.popularProductList[position]);
                      },
                    ),
                    // ),
                  )
                : CircularProgressIndicator(
                    color: Colors.blue,
                  );
          },
        ),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length <= 0
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.blue[300],
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(
                'Recommended',
                style: TextStyle(
                    fontSize: Dimensions.font20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                'Food Pairing',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
        SizedBox(height: Dimensions.height20),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Dimensions.radius20),
                                  bottomLeft:
                                      Radius.circular(Dimensions.radius20),
                                ),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstant.BASE_URL +
                                      AppConstant.UPLOAD_URL +
                                      recommendedProducts
                                          .recommendedProductList[index].img!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      right: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        recommendedProducts
                                            .recommendedProductList[index]
                                            .name!,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'with chinese characteristics',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: Colors.yellow.shade800,
                                          ),
                                          SizedBox(width: 2),
                                          IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: "1.7km",
                                            iconColor: Colors.blue.shade200,
                                          ),
                                          SizedBox(width: 2),
                                          IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: "32mins",
                                            iconColor: Colors.brown.shade200,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: Colors.blue,
                );
        })
      ],
    );
  }
}

Widget _buildPageItem(int index, int _currPageValue, double _scaleFactor,
    num _height, ProductModel popularProduct) {
  Matrix4 matrix = new Matrix4.identity();
  if (index == _currPageValue.floor()) {
    var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == _currPageValue.floor() + 1) {
    var currScale =
        _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == _currPageValue.floor() - 1) {
    var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else {
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
  }

  return Transform(
    transform: matrix,
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getPopularFood(index));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven ? Color(0xff68c5df) : Color(0xff68c5cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    AppConstant.BASE_URL + "/uploads/" + popularProduct.img!),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left: 28, right: 28, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 2), // Adjust offset as needed
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0), // Adjust offset as needed
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0), // Adjust offset as needed
                ),
              ],
            ),
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          popularProduct.name!
                              .split(' ')
                              .take(3)
                              .join(' '), // Extract first 2 words
                          style: TextStyle(
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return Icon(Icons.star,
                                color: Colors.blue[300], size: 15);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "5263",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "comments",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Add rounded corners
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: Colors.yellow.shade800,
                        ),
                        SizedBox(width: 10),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: Colors.blue.shade200,
                        ),
                        SizedBox(width: 10),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32mins",
                          iconColor: Colors.brown.shade200,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
