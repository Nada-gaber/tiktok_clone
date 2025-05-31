import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/themes/images.dart';
import '../../../../core/widgets/loading_tiktok_widget.dart';
import '../../logic/cubit/video/video_state.dart';
import '../../logic/cubit/video/videos_cubit.dart';
import '../widgets/reel_icon_button.dart';
import '../widgets/video_play_widget.dart';

class ReelsVideo extends StatefulWidget {
  const ReelsVideo({super.key});

  @override
  State<ReelsVideo> createState() => _ReelsVideoState();
}

class _ReelsVideoState extends State<ReelsVideo> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VideoCubit>()..fetchVideos(),
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingTiktokWidget(),
            loading: () => const LoadingTiktokWidget(),
            loaded: (videoModel) {
              final videos = videoModel.hits;

              return PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemCount: videos?.length,
                itemBuilder: (context, index) {
                  final video = videos?[index];
                  final videoLink = video!.videos!.tiny!.url;
                  if (videoLink.isEmpty || videoLink == null) {
                    return const Center(child: Text("Video not available"));
                  }

                  return Stack(
                    children: [
                      // Video Player Background
                      Positioned.fill(
                        child: AutoPlayVideoPlayer(
                          url: videoLink ?? "",
                          play: currentIndex == index,
                        ),
                      ),

                      // Action Buttons (on right side)
                      Positioned(
                        bottom: 150,
                        right: 16,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                video.userImageURL ??
                                    "https://example.com/default.jpg",
                              ),
                            ),
                            const SizedBox(height: 23.0),
                            ReelIconButton(
                                iconString: video.likes.toString(),
                                assetName: AppAssets.heartIcon),
                            ReelIconButton(
                                iconString: video.comments.toString(),
                                assetName: AppAssets.commentIcon),
                            const ReelIconButton(
                                iconString: 'Share',
                                assetName: AppAssets.shareIcon),
                          ],
                        ),
                      ),

                      // Username (above tags)
                      Positioned(
                        bottom: 50,
                        left: 16,
                        right: 100, // leave space for right-side buttons
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@${video.user ?? "Unknown"} ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: video.tags!
                                  .split(',')
                                  .map((tag) => Text(
                                        '#${tag.trim()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
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