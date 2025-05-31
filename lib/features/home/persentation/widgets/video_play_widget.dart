import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/widgets/loading_tiktok_widget.dart';

class AutoPlayVideoPlayer extends StatefulWidget {
  final String url;
  final bool play;

  const AutoPlayVideoPlayer({
    super.key,
    required this.url,
    required this.play,
  });

  @override
  State<AutoPlayVideoPlayer> createState() => _AutoPlayVideoPlayerState();
}

class _AutoPlayVideoPlayerState extends State<AutoPlayVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant AutoPlayVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.play) {
      _controller.play();
    } else {
      _controller.pause();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : const LoadingTiktokWidget();
  }
}
