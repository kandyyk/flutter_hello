import 'package:flutter/material.dart';
import 'package:flutter_hello/utils/utils.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoView extends StatefulWidget {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  var isVideoReady = false;
  var isPlaying = false;
  Function? loaded;

  GlobalKey<_VideoViewState> key;

  final String url;

  VideoView(this.url, {required this.key, this.loaded});

  pause() {
    key.currentState?.changePlayState();
  }

  play() {
    key.currentState?.changePlayState();
  }

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  initPlayer() async {
    if (widget.url.contains('http://') || widget.url.contains('https://')) {
      widget.videoPlayerController = VideoPlayerController.network(widget.url);
    } else {
      widget.videoPlayerController = VideoPlayerController.asset(widget.url);
    }

    await widget.videoPlayerController.initialize();

    widget.chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: false,
      looping: true,
      showControlsOnInitialize: false,
      showControls: false,
    );

    setState(() {
      widget.isVideoReady = true;
      widget.videoPlayerController.play();
      widget.videoPlayerController.pause();
      if (widget.loaded != null) {
        widget.loaded!();
      }
    });
  }

  changePlayState() {
    setState(() {
      if (widget.videoPlayerController.value.isPlaying) {
        widget.videoPlayerController.pause();
        widget.isPlaying = false;
      } else {
        widget.videoPlayerController.play();
        widget.isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVideoReady) {
      return Container();
    }
    return Stack(
      children: [
        InkWell(
          onTap: changePlayState,
          child: Chewie(
            controller: widget.chewieController,
          ),
        ),
        widget.isPlaying
            ? Container()
            : Center(
                child: InkWell(
                    onTap: changePlayState,
                    child: Image.asset(
                      'assets/images/pause.webp',
                      scale: 1.5,
                    )),
              )
      ],
    );
  }

  @override
  void dispose() {
    //首页一直存在，videoPlayerController不移除
    widget.videoPlayerController.dispose();
    widget.chewieController.dispose();
    super.dispose();
  }
}
