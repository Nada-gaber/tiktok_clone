import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../logic/cubit/video/video_state.dart';
import '../../logic/cubit/video/videos_cubit.dart';
import '../widgets/video_play_widget.dart';

class ReelsVideo extends StatelessWidget {
  const ReelsVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VideoCubit>()..fetchVideos(),
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text("initial")),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (videoModel) {
              final videos = videoModel.videos;

              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  final videoLink = video.videoFiles.first.link;

                  return Stack(
                    children: [
                      Positioned.fill(
                        child: VideoPlayerWidget(url: videoLink),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 16,
                        child: Text(
                          '🎥 Video ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            error: (message) => Center(child: Text("Error: $message")),
          );
        },
      ),
    );
  }
}
