import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

mybody() {
  AudioPlayer ap = AudioPlayer();
  AudioCache ac;
  AudioPlayer ap1 = AudioPlayer();

  ac = new AudioCache(fixedPlayer: ap);
  int result = 0;

  VideoPlayerController _controller, _controller2;
  Future<void> _initializeVideoPlayerFuture, _initializeVideoPlayerFuture2;
  _controller2 = VideoPlayerController.network(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
  _controller = VideoPlayerController.asset("assets/sample_video.mp4");

  _initializeVideoPlayerFuture = _controller.initialize();
  _controller.setLooping(true);
  _controller.setVolume(1.0);

  _initializeVideoPlayerFuture2 = _controller2.initialize();
  _controller2.setLooping(true);
  _controller2.setVolume(1.0);

  return Container(
    padding: EdgeInsets.all(10),
    color: HexColor('322f3d'),
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          color: HexColor("87556f"),
          child: Text(
            " Audio from assets ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: HexColor("87556f"),
              onPressed: () async {
                result++;
                await ac.play("aaftaab.mp3");
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              color: HexColor("87556f"),
              onPressed: () async {
                await ap.pause();
              },
              child: Icon(
                Icons.pause,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              color: HexColor("87556f"),
              onPressed: () async {
                if (result != 0)
                  await ap.stop();
                else
                  result = 0;
              },
              child: Icon(
                Icons.crop_square,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Card(
          color: HexColor("87556f"),
          child: Text(
            " Audio from internet ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: HexColor("87556f"),
              onPressed: () async {
                await ap1.play(
                    "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3");
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              color: HexColor("87556f"),
              onPressed: () async {
                await ap1.pause();
              },
              child: Icon(
                Icons.pause,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              color: HexColor("87556f"),
              onPressed: () async {
                await ap1.stop();
              },
              child: Icon(
                Icons.crop_square,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: Column(
                children: <Widget>[
                  Card(
                    color: HexColor("87556f"),
                    child: Text(
                      " Video from Assets ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Center(
                          child: AspectRatio(
                            aspectRatio: 16.0 / 9.0,
                            child: VideoPlayer(_controller),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: HexColor("87556f"),
                  onPressed: () {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  },
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                RaisedButton(
                  color: HexColor("87556f"),
                  onPressed: () async {
                    await _controller.seekTo(Duration.zero);
                    _controller.pause();
                  },
                  child: Icon(
                    Icons.crop_square,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Card(
              color: HexColor("87556f"),
              child: Text(
                " Video from Internet ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture2,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Center(
                          child: AspectRatio(
                            aspectRatio: 16.0 / 9.0,
                            child: VideoPlayer(_controller2),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: HexColor("87556f"),
                  onPressed: () {
                    if (_controller2.value.isPlaying) {
                      _controller2.pause();
                    } else {
                      _controller2.play();
                    }
                  },
                  child: Icon(
                    _controller2.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                RaisedButton(
                  color: HexColor("87556f"),
                  onPressed: () async {
                    await _controller2.seekTo(Duration.zero);
                    _controller2.pause();
                  },
                  child: Icon(
                    Icons.crop_square,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
