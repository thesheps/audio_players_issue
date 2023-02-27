import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final _audioPlayer = AudioPlayer();

  var _duration = Duration.zero;
  var _playbackRate = 1.0;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onPositionChanged.listen((d) {
      setState(() => _duration = d);
    });
  }

  play() async {
    await _audioPlayer.play(
      UrlSource(
          'https://www2.cs.uic.edu/~i101/SoundFiles/BabyElephantWalk60.wav'),
    );
  }

  setPlaybackRate(double d) async {
    setState(() => _playbackRate = d);
    _audioPlayer.setPlaybackRate(d);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('AudioPlayers Position Issue'))),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Position: $_duration'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Playback rate: $_playbackRate'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      FilledButton(onPressed: play, child: const Text("Play")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () async => await setPlaybackRate(0.5),
                        child: const Text('0.5'),
                      ),
                      OutlinedButton(
                        onPressed: () async => await setPlaybackRate(1.0),
                        child: const Text('1.0'),
                      ),
                      OutlinedButton(
                        onPressed: () async => await setPlaybackRate(1.5),
                        child: const Text('1.5'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
