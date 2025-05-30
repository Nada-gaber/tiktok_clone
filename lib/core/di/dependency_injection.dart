import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/video_repo.dart';
import '../../features/home/logic/cubit/video/videos_cubit.dart';
import '../../features/videos/logic/video_searching_cubit.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio Client
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // API Layer
  getIt.registerLazySingleton<PexelsApi>(
    () => PexelsApi(getIt<DioClient>().client),
  );

  // Repository
  getIt.registerLazySingleton<VideoRepository>(
    () => VideoRepository(getIt<PexelsApi>()),
  );

  // Cubit
  getIt.registerFactory<VideoCubit>(
    () => VideoCubit(getIt<VideoRepository>()),
  );
    getIt.registerFactory<SearchVideoCubit>(
    () => SearchVideoCubit(getIt<VideoRepository>()),
  );
}
