import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/home/data/models/video_model.dart';

part 'api_services.g.dart';

@RestApi(
    baseUrl: 'https://pixabay.com/api')
abstract class PexelsApi {
  factory PexelsApi(Dio dio, {String baseUrl}) = _PexelsApi;



    @GET('/videos/')
  Future<PixabayResponse> getCuratedPhotos(
    @Query('key') String apiKey, {
    @Query('q') String? query,
    @Query('category') String? category,
    @Query('video_type') String? videoType,
  });
}
