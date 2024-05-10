import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:upt_test/data/models/media_content_model/media_content_model.dart';
import 'package:upt_test/pages/full_screen_media_page/widgets/controls_overlay.dart';
import 'package:upt_test/widgets/close_widget.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class FullScreenMediaPage extends StatefulWidget {
  final MediaContentModel media;

  const FullScreenMediaPage({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  State<FullScreenMediaPage> createState() => _FullScreenMediaPageState();
}

class _FullScreenMediaPageState extends State<FullScreenMediaPage> {
  VideoPlayerController? _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.media.type == 'video') {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(
          widget.media.sourceUrl,
        ),
        videoPlayerOptions: VideoPlayerOptions(),
      );

      _controller!.addListener(() {
        setState(() {});
      });
      _controller!.setLooping(true);
      _controller!.initialize().then((value) {
        setState(() {
          isLoading = false;
        });
        _controller!.play();
      });
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: widget.media.type == 'video'
          ? Stack(
              children: [
                isLoading
                    ? Container(
                        width: width,
                        height: height,
                        color: Colors.black,
                        child: Stack(
                          children: [
                            Center(
                              child: Hero(
                                tag: widget.media.sourceUrl,
                                child: Image.network(
                                  widget.media.thumbnail,
                                ),
                              ),
                            ),
                            const Center(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.lineSpinFadeLoader,
                                  colors: [Colors.white],
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: width,
                        height: height,
                        color: Colors.black,
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                VideoPlayer(
                                  _controller!,
                                ),
                                ClosedCaption(
                                  text: _controller!.value.caption.text,
                                ),
                                ControlsOverlay(
                                  controller: _controller!,
                                ),
                                VideoProgressIndicator(
                                  _controller!,
                                  allowScrubbing: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const Positioned(
                  right: 16,
                  top: 32,
                  child: CloseWidget(),
                ),
              ],
            )
          : Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: Center(
                    child: Hero(
                      tag: widget.media.sourceUrl,
                      child: Image.network(
                        widget.media.sourceUrl,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 16,
                  top: 32,
                  child: CloseWidget(),
                ),
              ],
            ),
    );
  }
}
