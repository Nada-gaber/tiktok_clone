import '../../../../core/networking/api_services.dart';
import '../models/video_model.dart';

class VideoRepository {
  final PexelsApi _api;

  VideoRepository(this._api);

  Future<PexelsVideoModel> getVideos() async {
    return _api.getCuratedPhotos();
  }
}
