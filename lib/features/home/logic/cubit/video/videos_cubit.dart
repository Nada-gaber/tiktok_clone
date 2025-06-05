import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/home/data/repo/video_repo.dart';
import 'package:tiktok_clone/features/home/logic/cubit/video/video_state.dart';


class VideoCubit extends Cubit<VideoState> {
  final VideoRepository repository;

  VideoCubit(this.repository) : super(const VideoState.initial());

 Future<void> fetchVideos() async {
  emit(const VideoState.loading());
  try {
    final data = await repository.getVideos();
    log("Data: $data");  
     if(isClosed) return; 
    emit(VideoState.loaded(data));
  } catch (e) {
    log("Error: $e");  
    if(isClosed) return; 
    emit(VideoState.error(e.toString()));
  }
}

}
