import 'package:flutter/material.dart';

class CustomdashboardController extends ChangeNotifier {
  static final CustomdashboardController instance =
      CustomdashboardController._internal();
  factory CustomdashboardController() => instance;

  CustomdashboardController._internal();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDesktopDrawerOpen = true;
  Widget currentScreen = const Center(child: Text('Dashboard'));

  int selectedIndex = 0;

  void switchScreen(Widget screen) {
    currentScreen = screen;
    scaffoldKey.currentState?.closeDrawer();
    notifyListeners();
  }

  void toggleSidebar(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    if (isMobile) {
      scaffoldKey.currentState?.isDrawerOpen ?? false
          ? scaffoldKey.currentState?.closeDrawer()
          : scaffoldKey.currentState?.openDrawer();
    } else {
      isDesktopDrawerOpen = !isDesktopDrawerOpen;
      notifyListeners();
    }
  }
}
