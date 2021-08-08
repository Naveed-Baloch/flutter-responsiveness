import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/models/content_model.dart';
import 'package:video_player/video_player.dart';
import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _CustomHeaderMobile(featuredContent: featuredContent),
      desktop: _CustomHeaderDesktop(featuredContent: featuredContent),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      onPressed: () {
        print('play');
      },
      color: Colors.white,
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
      ),
      label: const Text(
        'Play',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CustomHeaderMobile extends StatelessWidget {
  final featuredContent;

  _CustomHeaderMobile({this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image(
              image: AssetImage(featuredContent.titleImageUrl),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print('My List'),
              ),
              _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () => print('info'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _CustomHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  _CustomHeaderDesktop({this.featuredContent});

  @override
  __CustomHeaderDesktopState createState() => __CustomHeaderDesktopState();
}

class __CustomHeaderDesktopState extends State<_CustomHeaderDesktop> {
  VideoPlayerController _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)..play();
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            bottom: 1.0,
            left: 0.0,
            right: 0.0,
            child: AspectRatio(
              aspectRatio: _videoController.value.initialized
                  ? _videoController.value.aspectRatio
                  : 2.344,
              child: _videoController.value.initialized
                  ? VideoPlayer(_videoController)
                  : Image.asset(
                      widget.featuredContent.imageUrl,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          AspectRatio(
            aspectRatio: _videoController.value.initialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
            ),
          ),

          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featuredContent.titleImageUrl),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.featuredContent.description,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 4.0),
                          blurRadius: 6.0,
                        )
                      ]),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(
                      width: 16.0,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline),
                      label: const Text(
                        'More Info',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    if (_videoController.value.initialized)
                      IconButton(
                        onPressed: () => setState(() {
                          _isMuted
                              ? _videoController.setVolume(100)
                              : _videoController.setVolume(0);
                          _isMuted = _videoController.value.volume == 0;
                        }),
                        color: Colors.white,
                        iconSize: 30.0,
                        icon:
                            Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
