import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../domain/core/model/album/photos_response_model.dart';

class PhotoListPageController extends GetxController {
  int? albumId;
  RxBool isLoading = false.obs;

  var photos = <PhotosResponseModel>[].obs;

  void fetchPhotos(int albumId) async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
      if (response.statusCode == 200) {
        isLoading.value = false;
        var jsonResponse = json.decode(response.body) as List;
        var photosResult = jsonResponse
            .map((photo) => PhotosResponseModel.fromJson(photo))
            .toList();
        photos.assignAll(photosResult);
      } else {
        isLoading.value = false;
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      isLoading.value = false;
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    albumId = Get.arguments['album_id'];

    if (albumId != null) {
      fetchPhotos(albumId!);
    }

    super.onInit();
  }
}
