import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/profile/data/models/video_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://api.pexels.com/videos")
abstract class PexelsApi {
  factory PexelsApi(Dio dio, {String baseUrl}) = _PexelsApi;

  @GET('/popular')
  Future<PexelsVideoModel> getCuratedPhotos();
}
