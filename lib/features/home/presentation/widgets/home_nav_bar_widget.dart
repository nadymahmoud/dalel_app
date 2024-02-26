import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/cart/presentation/views/cart_view.dart';
import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/profile/presentation/views/profile_view.dart';
import 'package:dalel_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

PersistentTabController _controller = PersistentTabController();

class HomeViewNavBarWidget extends StatelessWidget {
  const HomeViewNavBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: _controller,
      items: _navBarsItems(),
      backgroundColor: AppColors.primaryColor,
      navBarStyle: NavBarStyle.style12,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomeView(),
    CartView(),
    SearchView(),
    ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.imagesHomeIcon),
        icon: SvgPicture.asset(Assets.imagesHomeIconActive)),
    PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.imagesShoppingCart),
        icon: SvgPicture.asset(Assets.imagesShoppingCartActive)),
    PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.imagesSearch),
        icon: SvgPicture.asset(Assets.imagesSearchIconActive)),
    PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.imagesPerson),
        icon: SvgPicture.asset(Assets.imagesProfileIconActive)),
  ];
}
