import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/features/common/widgets/common_app_bar.dart';
import 'package:bookworm/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Bookworm',
        backgroundColor: Pallet.background,
      ),
      body: SafeArea(
          child: Obx(() =>
              homeController.getNavScreen()[homeController.navBarIndex.value])),
      bottomNavigationBar: Obx(() => NavigationBar(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            indicatorColor: Pallet.primaryLight,
            onDestinationSelected: (index) {
              homeController.navBarIndex.value = index;
            },
            selectedIndex: homeController.navBarIndex.value,
            destinations: homeController.getNavigationDestination(),
          )),
    );
  }
}
