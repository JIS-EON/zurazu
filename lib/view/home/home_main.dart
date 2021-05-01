import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zurazu/util/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zurazu/view/home/product_page.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

  List<String> paths = [
    'assets/image/1.png', 'assets/image/2.png', 'assets/image/3.png', 'assets/image/4.png',
    'assets/image/1.png', 'assets/image/2.png', 'assets/image/3.png', 'assets/image/4.png'];
  List<String> names = ['test1', 'test2', 'test3', 'test4', 'test1', 'test2', 'test3', 'test4'];
  List<String> prices = ['16,000원', '23,000원', '5,000원', '25,000원', '16,000원', '23,000원', '5,000원', '25,000원'];



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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: paths.length,
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.fit(1),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                crossAxisCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return gridItem(index);
                },
              ),
            )
          ),
        ),
      ),
    );
  }

  gridItem(int index) {
    return GestureDetector(
      onDoubleTap: () {return;},
      onTap: () {
        pushNewScreen(context, screen: ProductPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: coWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),

        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.h, right: 10.w, left: 10.w, bottom: 80.h),
              child: Center(
                child: Image.asset(paths[index]),
              ),
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: coMain,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                child: Row(
                  children: [
                    Text(names[index], style: TextStyle(color: coWhite),),
                    Spacer(),
                    Text(prices[index], style: TextStyle(color: coWhite),),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  topAppBar() {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      backgroundColor: coWhite,
      centerTitle: true,
      title: Container(
          width: 1.sw,
          child: Center(
            child: SvgPicture.asset('assets/svg/logo_svg.svg'),
          )
      ),
    );
  }

}