import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zurazu/util/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: coWhite,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: coWhite,
          appBar: topAppBar(),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 50.w),
                      child: Image.asset('assets/image/2.png'),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('스트라이프 바지', style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),),
                  ),
                  Text('￦20,000', style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25.h),
                    child: Divider(
                      color: coDividerGray,
                      thickness: 1.0,
                      height: 0,
                    ),
                  ),






                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  productInfo() {

  }

  topAppBar() {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      backgroundColor: coWhite,
      leading: IconButton(
        icon: SvgPicture.asset('assets/svg/back.svg',
        width: 15, height: 15,),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Container(
          width: 1.sw,
          child: Center(
            child: SvgPicture.asset('assets/svg/logo_svg.svg'),
          )
      ),
      actions: [
        GestureDetector(
          onDoubleTap: () {return;},
          onTap: () {
            //pushNewScreen(context, screen: NotiMain());
            setState(() {});
          },
          child: Container(
            margin: EdgeInsets.only(right: 50.w),
            child: SvgPicture.asset('assets/svg/notification.svg')),
        )
      ],
    );
  }

}