import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:manushtech_task/app/utilities/extensions/widget.extensions.dart';
import 'package:manushtech_task/app/utilities/widgets/no_data_available/no_data_available_widget.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Search Albums...',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.black38,),
                  onPressed: () {
                    controller.searchController.clear();
                    controller.searchQuery.value = '';
                  },
                ),
              ),
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.loadingController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var filteredAlbums = controller.albums.where((album) {
            return album.title!
                .toLowerCase()
                .contains(controller.searchQuery.value.toLowerCase());
          }).toList();

          return filteredAlbums.isEmpty ? const Center(child: NoDataAvailableWidget()) : ListView.builder(
            itemCount: filteredAlbums.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.PHOTO_LIST_PAGE,
                          arguments: {
                            'album_id': filteredAlbums[index].id,
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: Get.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(7),
                            color: index % 2 == 0
                                ? Colors.green.withOpacity(0.1)
                                : Colors.white),
                        child: Text(filteredAlbums[index].title ?? 'No Title'),
                      ),
                    ),
                    10.verticalSpacing,
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
