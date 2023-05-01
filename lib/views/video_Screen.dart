import 'dart:math';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  final List<String> ids = [
    'P0uaLRO6V1U',
    'v69praWH6cs',
    'pWKQId6Z85U',
    'y5lapak5eOk',
    'QS-CVp0JNJU',
    'MEWTDDik9vU',
    'GcGPzT5THKY',
  ];
  final _random = new Random();
  late YoutubePlayerController _controller;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return     ListView.builder(
itemCount: ids.length,
itemBuilder: (context,index){
  _controller  = YoutubePlayerController(
    initialVideoId: ids[_random.nextInt(ids.length)],
    flags: YoutubePlayerFlags(
      autoPlay: false,
    ),
  );

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor:Colors.amber,

      onReady: () {
        //  _controller.addListener(listener);
      },
    ),
  );
},
    );
  }
}
