import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/profile/data/models/video_model.dart';

part 'api_services.g.dart';

// final dio = Dio(BaseOptions(
//   baseUrl: 'https://pixabay.com/api/?key=${dotenv.env['PIXABAY_API_KEY']}',
// ));
// final api = PexelsApi(dio)..getCuratedPhotos(dotenv.env['PIXABAY_API_KEY'] ?? '');

@RestApi(
    baseUrl: 'https://pixabay.com/api')
abstract class PexelsApi {
  factory PexelsApi(Dio dio, {String baseUrl}) = _PexelsApi;

  @GET('/videos/')
  Future<PixabayResponse> getCuratedPhotos(@Query('key') String apiKey);
}
