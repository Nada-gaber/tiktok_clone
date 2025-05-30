import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/networking/api_services.dart';
import '../models/video_model.dart';


class VideoRepository {
  final PexelsApi _api;

  VideoRepository(this._api);

  Future<PixabayResponse> getVideos({
    String? query,
    String? category,
    String? videoType,
  }) async {
    return _api.getCuratedPhotos(
      dotenv.env['PIXABAY_API_KEY'] ?? '',
      query: query,
      category: category,
      videoType: videoType,
    );
  }
}
