
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void showFullScreenMeme(BuildContext context, meme) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        // Remove dialog padding to make it fullscreen
        backgroundColor: Colors.black.withOpacity(0.9),
        // Dark background for better visibility
        child: Stack(
          children: [
// Full-screen meme (image or video)
            Center(
              child: meme['url'].endsWith('mp4')
                  ? // If meme is a video, use VideoPlayerWidget
                  AspectRatio(
                      aspectRatio: 16 / 9,
                      child: VideoPlayerWidget(url: meme['url']),
                    )
                  : // If meme is an image, make it fill the screen
                  Image.network(
                      meme['url'],
                      fit: BoxFit
                          .contain, // Ensures the image scales without distortion
                    ),
            ),
// Close button
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;

  VideoPlayerWidget({required this.url});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading video'));
        } else {
          return GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          );
        }
      },
    );
  }
}
