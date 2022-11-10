import 'package:fluze/ui/pages/account.dart';
import 'package:fluze/ui/pages/passcode.dart';
import 'package:fluze/ui/pages/profile.dart';
import 'package:get/get.dart';

import 'naviagation_manager_interface.dart';


class NavigationManager implements NavigationManagerInterface {
  @override
  Future? push(AppRoute route, {dynamic arguments}) {
    return Get.to(_getPageForRoute(route, arguments: arguments));
  }

  @override
  void pushClean(AppRoute route, {dynamic arguments}) {
    Get.offAll(_getPageForRoute(route, arguments: arguments));
  }

  _getPageForRoute(AppRoute route, {dynamic arguments}) {
    switch (route) {
      case AppRoute.profilePage:
        return ProfilePage();
      case AppRoute.accountPage:
        return AccountPage();
      case AppRoute.passcodePage:
        return PasscodePage();
    }
  }

  @override
  void pop({dynamic result}) {
    Get.back(result: result);
  }

}