import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Personal Homepage',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), _changeOpacity);
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
      // backgroundColor: Colors.yellow.shade50,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          children: [
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity: opacityLevel,
                  duration: const Duration(seconds: 2),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 62,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                      children: [
                        const TextSpan(text: 'Hi, I\'m '),
                        TextSpan(
                          text: 'Sơn!\n',
                          style: TextStyle(color: Colors.yellow.shade600),
                        ),
                        const TextSpan(text: 'Mobile Developer\n'),
                        const TextSpan(text: 'in Hanoi.'),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(height: 24),
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ButtonStyle(
                //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                //     backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade800),
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //       RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8),
                //         side: BorderSide(color: Colors.yellow.shade800),
                //       ),
                //     ),
                //   ),
                //   child: const Padding(
                //     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                //     child: Text(
                //       'Contact',
                //       style: TextStyle(
                //         fontSize: 24,
                //         fontFamily: 'Inter',
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            const Spacer(),
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  'assets/avatar.png',
                  width: 512,
                  height: 512,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
