import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manushtech_task/domain/core/model/album/album_response_model.dart';

import 'package:http/http.dart' as http;
import '../../../utilities/widgets/common_widgets/loader/loading.controller.dart';

class HomeController extends GetxController {
  List<AlbumResponseModel> albums = <AlbumResponseModel>[].obs;
  var searchQuery = ''.obs;
  LoadingController loadingController = Get.put(LoadingController());
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAlbums();
  }

  void fetchAlbums() async {
    try {
      loadingController.isLoading = true;
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      if (response.statusCode == 200) {
        loadingController.isLoading = false;
        var jsonResponse = json.decode(response.body) as List;
        var albumsResult = jsonResponse
            .map((album) => AlbumResponseModel.fromJson(album))
            .toList();
        albums.assignAll(albumsResult);
      } else {
        loadingController.isLoading = false;
        throw Exception('Failed to load albums');
      }
    } catch (e, t) {
      loadingController.isLoading = false;
      debugPrint('$e');
      debugPrint('$t');
    } finally {
      loadingController.isLoading = false;
    }
  }
}
