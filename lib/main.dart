import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:swipedetector/swipedetector.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"),
      ],
      locale: Locale("ar", "AE"),
      title: 'تطبيقي',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _swipeDirection = "";
  FlutterTts flutterTts;
  String s="";



  Widget createButton(String word){
    return  InkWell(
      onTap: (){
        _speak(word);
        s=s+word;
        print(s);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        color: Colors.grey,
        child: Center(
          child: Text(
            '$word',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();
    flutterTts.setLanguage("ar");
  }




  Future _speak(String word) async {

    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(word);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('تطبيقي'),
        ),
        body: GestureDetector(
          onLongPress: (){
            s=s+' ';
            print(s);
          },
          child: SwipeDetector(
            onSwipeUp: () {
              setState(() {
                _swipeDirection = "Swipe Up";
                if(s.length>0) {
                  _speak("$s");
                }else{
                  _speak("الرسالة فارغة");
                }
              });
            },
            onSwipeDown: () {
              setState(() {
                _swipeDirection = "Swipe Down";
                if(s.length>0) {
                  _speak("تم حدف اخر حرف");
                }else{
                  _speak("الرسالة فارغة");
                }
                setState(() {
                  s=s.substring(0, s.length - 1);
                  print(s);
                });
              });
            },
            onSwipeLeft: () {
              setState(() {
                _swipeDirection = "Swipe Left";
                _speak("اليسار");
              });
            },
            onSwipeRight: () {
              setState(() {
                _swipeDirection = "Swipe Right";
                _speak("اليمين");
              });
            },
            swipeConfiguration: SwipeConfiguration(
                verticalSwipeMinVelocity: 100.0,
                verticalSwipeMinDisplacement: 50.0,
                verticalSwipeMaxWidthThreshold:100.0,
                horizontalSwipeMaxHeightThreshold: 50.0,
                horizontalSwipeMinDisplacement:50.0,
                horizontalSwipeMinVelocity: 200.0),
            child: TabBarView(
                children: <Widget>[
                    GridView.count(
                        childAspectRatio: 0.55,
                        crossAxisCount: 3,
                        physics: NeverScrollableScrollPhysics(),
                        // Generate 100 widgets that display their index in the List.
                        children:[
                          createButton("ا"),
                          createButton("ب"),
                          createButton("ت"),
                          createButton("ث"),
                          createButton("ج"),
                          createButton("ح"),
                          createButton("خ"),
                          createButton("د"),
                          createButton("ذ"),
                        ],
                      ),

                  GridView.count(
                      childAspectRatio: 0.55,
                      crossAxisCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      // Generate 100 widgets that display their index in the List.
                      children:[
                        createButton("ر"),
                        createButton("ز"),
                        createButton("س"),
                        createButton("ش"),
                        createButton("ص"),
                        createButton("ض"),
                        createButton("ط"),
                        createButton("ظ"),
                        createButton("غ"),
                      ],
                    ),
                  GridView.count(
                      childAspectRatio: 0.55,
                      crossAxisCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      // Generate 100 widgets that display their index in the List.
                      children:[
                        createButton("ف"),
                        createButton("ق"),
                        createButton("ك"),
                        createButton("ل"),
                        createButton("م"),
                        createButton("ن"),
                        createButton("ه"),
                        createButton("و"),
                        createButton("ي"),
                      ],
                    ),
                ] ),
          ),
        ),
      ),
    );
  }
}