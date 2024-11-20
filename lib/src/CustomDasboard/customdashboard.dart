import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';
import 'sidebar.dart';

class Customdashboard extends StatelessWidget {
  final Widget? sideBar;
  final Widget? mobileSidebar;
  final Widget? desktopSidebar;

  final PreferredSizeWidget? appBar;
  final Widget? body;
  const Customdashboard({
    super.key,
    this.sideBar,
    this.mobileSidebar,
    this.desktopSidebar,
    this.appBar,
    this.body,
  });

  static void toggleSidebar(BuildContext context) {
    CustomdashboardController.instance.toggleSidebar(context);
  }

  static void setScreen(Widget newScreen) {
    CustomdashboardController.instance.switchScreen(newScreen);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomdashboardController>.value(
      value: CustomdashboardController.instance,
      child: Builder(
        builder: (context) {
          final isMobile = MediaQuery.of(context).size.width < 600;
          final controller = Provider.of<CustomdashboardController>(context);

          return Row(
            children: [
              if (!isMobile && controller.isDesktopDrawerOpen)
                desktopSidebar ?? sideBar ?? const DefaultSideBar(),
              Expanded(
                child: Scaffold(
                    key: controller.scaffoldKey,
                    appBar: appBar ?? defaulAppBar(context),
                    drawer: isMobile
                        ? mobileSidebar ?? sideBar ?? const DefaultSideBar()
                        : null,
                    body: body ?? controller.currentScreen),
              ),
            ],
          );
        },
      ),
    );
  }

  AppBar defaulAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade700,
      leading: IconButton(
          onPressed: () {
            Customdashboard.toggleSidebar(context);
          },
          icon: const Icon(Icons.menu)),
    );
  }
}
