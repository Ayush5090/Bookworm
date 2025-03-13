import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/features/common/widgets/app_textfield.dart';
import 'package:bookworm/features/home/controller/home_controller.dart';
import 'package:bookworm/features/home/widgets/books_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Obx(() => Skeletonizer(
            enabled: homeController.homeLoading.value,
            enableSwitchAnimation: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextField(
                  controller: homeController.searchController,
                  hintText: 'Search Books',
                  suffixIcon: IconButton(
                      onPressed: () => homeController.searchBooks(),
                      icon: Icon(Icons.search)),
                  textInputAction: TextInputAction.search,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Love and Romance',
                  style: TextStyle(
                      color: Pallet.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                BooksList(books: homeController.loveBooks),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Biographies',
                  style: TextStyle(
                      color: Pallet.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                BooksList(books: homeController.biographyBooks),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Action',
                  style: TextStyle(
                      color: Pallet.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                BooksList(books: homeController.actionBooks),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Adventure',
                  style: TextStyle(
                      color: Pallet.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                BooksList(books: homeController.adventureBooks),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Fantasy',
                  style: TextStyle(
                      color: Pallet.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                BooksList(books: homeController.fantasyBooks),
                SizedBox(
                  height: 10,
                ),
              ],
            ))),
      ),
    );
  }
}
