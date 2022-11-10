abstract class NavigationManagerInterface {
  Future? push(AppRoute route, {dynamic arguments});

  void pushClean(AppRoute route, {dynamic arguments});

  void pop({dynamic result});

}

enum AppRoute {
  profilePage,
  passcodePage,
  accountPage,
}

