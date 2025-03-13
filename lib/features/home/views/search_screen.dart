import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/features/common/widgets/common_app_bar.dart';
import 'package:bookworm/features/home/controller/home_controller.dart';
import 'package:bookworm/features/home/widgets/search_book_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late HomeController homeController;

  @override
  void initState() {
    homeController = Get.find();
    homeController.searchScrollController = ScrollController();
    homeController.addScrollListener();
    super.initState();
  }

  @override
  void dispose() {
    homeController.searchController.clear();
    homeController.searchScrollController.dispose();
    homeController.searchedBooks.clear();
    homeController.searchOffset = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: 'Bookworm',
          backgroundColor: Pallet.background,
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => Skeletonizer(
                    enabled: homeController.searchLoading.value,
                    enableSwitchAnimation: true,
                    child: homeController.searchLoading.value
                        ? ListView.builder(
                            controller: homeController.searchScrollController,
                            itemCount: 10,
                            itemBuilder: (context, index) => SearchBookCard(
                              authorName: BoneMock.name,
                              bookTitle: BoneMock.name,
                              coverId: 1,
                              publishYear:
                                  0000, // fake data for Skeletonizer loading
                            ),
                          )
                        : Column(
                            children: [
                              homeController.searchedBooks.isNotEmpty
                                  ? Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          controller: homeController
                                              .searchScrollController,
                                          itemCount: homeController
                                              .searchedBooks.length,
                                          itemBuilder: (context, index) => SearchBookCard(
                                              book: homeController
                                                  .searchedBooks[index],
                                              authorName: homeController
                                                      .searchedBooks[index]
                                                      .authorName?[0] ??
                                                  'NA',
                                              bookTitle: homeController
                                                  .searchedBooks[index].title!,
                                              coverId: homeController
                                                      .searchedBooks[index]
                                                      .coverId ??
                                                  1,
                                              publishYear:
                                                  homeController.searchedBooks[index].firstPublishYear ?? 0)))
                                  : Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: context.height * 0.3,
                                          ),
                                          Text(
                                            'No results found',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Pallet.secondary),
                                          )
                                        ],
                                      ),
                                    ),
                              if (homeController.onScrollLoading.value)
                                Center(
                                  child: SizedBox(
                                    width: context.width * 0.06,
                                    height: context.width * 0.06,
                                    child: CircularProgressIndicator.adaptive(
                                      valueColor: AlwaysStoppedAnimation(
                                          Pallet.primary),
                                    ),
                                  ),
                                )
                            ],
                          )),
              )),
        ));
  }
}
