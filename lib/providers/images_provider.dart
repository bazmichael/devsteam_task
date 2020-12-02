import 'dart:convert';
import 'package:devsteam/models/photo_vm.dart';
import 'package:devsteam/models/unsplash_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class HttpService {
  final Client _httpClient = Client();

  static const token =
      'cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';

  Future<List<PhotoViewModel>> loadPhotos() async {
    final response = await _getUnsplashImage(token);
    return _mapResponseToVm(response.photos);
  }

  Future<UnsplashResponse> _getUnsplashImage(String token,
      {int count = 10}) async {
    final url =
        'https://api.unsplash.com/photos/random?client_id=$token&count=$count';
    final result = await _httpClient.get(url);
    if (result.statusCode == 200) {
      final body = jsonDecode(result.body);
      return UnsplashResponse.fromJson(body);
    } else {
      return null;
    }
  }

  List<PhotoViewModel> _mapResponseToVm(List<UnsplashPhoto> photos) {
    return photos
        .map((e) => PhotoViewModel(
            author: e.user.name,
            fullImage: e.urls.small,
            thumbImage: e.urls.small,
            title: e.altDescription,
            userAvatar: e.user.profileImage.small))
        .toList(growable: false);
  }
}

class ImagesProvider with ChangeNotifier {
  final _httpService = HttpService();
  final _images = <PhotoViewModel>[];
  double pixels = 0.0;


  List<PhotoViewModel> get images => _images;

  ImagesProvider() {
    getPhotos();
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.maxScrollExtent == notification.metrics.pixels &&
        pixels != notification.metrics.pixels) {
      print('getting next 10 photos');
      pixels = notification.metrics.pixels;
      getPhotos();
    }
    return false;
  }

  Future<void> getPhotos() async {
    final photos = await _httpService.loadPhotos();
    _images.addAll(photos);
    notifyListeners();
  }

  Future<bool> refresh() async {
    pixels = 0.0;
    _images.clear();
    getPhotos();
    return true;
  }
}
