import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zurazu/view/main_tab_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: ''),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);
      Future.delayed(const Duration(milliseconds: 1000), () {
       pushNewScreen(context, screen: MainTabBar(), withNavBar: true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/image/splash.jpg", fit: BoxFit.cover,))
      ),
    );

  }
}
