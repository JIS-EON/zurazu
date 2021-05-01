import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zurazu/util/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:zurazu/view/home/home_main.dart';
import 'package:zurazu/view/search/search_main.dart';
import 'package:zurazu/view/like/like_main.dart';
import 'package:zurazu/view/mypage/mypage_main.dart';
import 'package:zurazu/view/box/box_main.dart';

class MainTabBar extends StatefulWidget {

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        SearchMain(),
        BoxMain(),
        HomeMain(),
        LikeMain(),
        MyPageMain()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems(int index) {
      return [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/svg/tab_search_e.svg', height: 25,),
            activeColor: coMain,
            inactiveColor: coGray
        ),
        PersistentBottomNavBarItem(
          icon : SvgPicture.asset('assets/svg/tab_box_e.svg', height: 25,),
            activeColor: coMain,
            inactiveColor: coGray
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/svg/tab_home_e.svg', height: 25,),
            activeColor: coMain,
            inactiveColor: coGray
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/svg/tab_like_e.svg', height: 25,),
            activeColor: coMain,
            inactiveColor: coGray
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/svg/tab_my_e.svg', height: 25,),
            activeColor: coMain,
            inactiveColor: coGray
        ),
      ];
    }

    return PersistentTabView(
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : kBottomNavigationBarHeight,
      hideNavigationBarWhenKeyboardShows: true,
      controller: _controller,
      screens: _buildScreens(),
      itemCount: _navBarsItems(_controller.index).length,
      confineInSafeArea: true,
      resizeToAvoidBottomInset: true,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: false,

      onItemSelected: (int) {
        setState(() {}); // This is required to update the nav bar if Android back button is pressed
      },
      customWidget: CustomNavBarWidget(
          items: _navBarsItems(_controller.index),
          selectedIndex: _controller.index,
          onItemSelected: (index) {
            setState(() {
              _controller.index = index;
            });
          }),
      navBarStyle: NavBarStyle.custom,
    );
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key key,
    this.selectedIndex,
    @required this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 15.0,
                  color: isSelected
                      ? (item.activeContentColor == null
                      ? item.activeColor
                      : item.activeContentColor)
                      : item.inactiveColor == null
                      ? item.activeColor
                      : item.inactiveColor),
              child: item.icon,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: coWhite,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : kBottomNavigationBarHeight,
        //height: 60.0,
        child: Column(
          children: [
            Divider(
              color: coMain,
              thickness: 1,
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.map((item) {
                var index = items.indexOf(item);
                return Flexible(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      this.onItemSelected(index);
                    },
                    child: _buildItem(item, selectedIndex == index, context),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}