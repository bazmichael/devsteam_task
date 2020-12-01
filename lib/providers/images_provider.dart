import 'dart:convert';
import 'package:devsteam/models/photo_vm.dart';
import 'package:devsteam/models/unsplash_response_model.dart';
import 'package:http/http.dart';

class ImagesProvider {
  final Client _httpClient = Client();
  static const token =
      'cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
  final _images = <PhotoViewModel>[];

  ImagesProvider();

  Future<void> loadPhotos() async {
    final response = await _getUnsplashImage(token);
    _images.addAll(_mapResponseToVm(response.photos));
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
    return photos.map((e) => PhotoViewModel(
        author: e.user.name,
        fullImage: e.urls.raw,
        thumbImage: e.urls.raw,
        title: e.altDescription)).toList(growable: false);
  }
}