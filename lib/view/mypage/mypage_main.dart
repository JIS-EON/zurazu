import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zurazu/util/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPageMain extends StatefulWidget {
  @override
  _MyPageMainState createState() => _MyPageMainState();
}

class _MyPageMainState extends State<MyPageMain> {

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
            child: Column(
              children: [

              ],
            ),
          ),
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