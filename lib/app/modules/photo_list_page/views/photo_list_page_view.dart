import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:manushtech_task/app/utilities/extensions/widget.extensions.dart';

import '../controllers/photo_list_page_controller.dart';

class PhotoListPageView extends GetView<PhotoListPageController> {
  const PhotoListPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.photos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18.0, left: 10, right: 10),
                child: Column(
                  children: [
                    ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: controller.photos[index].thumbnailUrl ?? '',
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      title: Text(controller.photos[index].title ?? 'No Title'),
                    ),
                    5.verticalSpacing,
                    const Divider(height: 1, color: Colors.black12,)
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
