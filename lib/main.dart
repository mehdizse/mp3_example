import 'dart:io'; 
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
 
void main() {
  runApp(MaterialApp(home: MyApp()));
}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
 
  @override
  void initState() {
    super.initState();
 
    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
    }
  }
 
 
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
 
            title: Text('Example mp3 asset'),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:30),
                  
                  Text('Play Local Asset \'sample.mp3\':'),
 
                  SizedBox(height: 30),
 
                  RaisedButton(
                    child: Text("Play Audio"),
                    onPressed: () => audioCache.play('sample.mp3')),
 
                  SizedBox(height: 30),
 
 
                ],
              ),
            ),
          ),
        );
  }
}
 