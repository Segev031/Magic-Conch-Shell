import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String image = 'assets/yes.png';
  bool _isVisible = false;

  void _playVideos() {
    Navigator.pushNamed(context, '/video');
    print('videos are playing...');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: HexColor("#caa0d0"),
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/ask.png'),
            IconButton(
              icon: Image.asset('assets/conch_shell.png'),
              iconSize: MediaQuery.of(context).size.width * 0.7,
              onPressed: () {
                setState(() {
                  image = generateAnswer()!;
                  _isVisible = true;
                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _isVisible = false;
                    });
                  });
                });
              },
            ),
            Visibility(
              visible: _isVisible,
              replacement: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
              ),
              child: Image.asset(
                image,
                width: MediaQuery.of(context).size.width,
                height: 50,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playVideos,
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String? generateAnswer() {
    Map<String, String> map = {
      "Yes": 'assets/yes.png',
      "No": 'assets/no.png',
      "Maybe": 'assets/maybe.png',
      "Ask me again": 'assets/ask_me_again.png'
    };
    List<String> answer = [
      'No',
      'Yes',
      'Maybe',
      'Yes',
      'No',
      'Ask me again',
      'Yes',
      'Maybe',
      'No',
      'Ask me again',
      'No',
      'Maybe',
      'Yes',
      'No'
    ];
    var rand = new Random();
    return map[answer[rand.nextInt(4294967296) % 14]];
  }
}
