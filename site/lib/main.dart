import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  usePathUrlStrategy();
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
    Future.delayed(const Duration(milliseconds: 100), _changeOpacity);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.yellow.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 64),
        child: Center(
          child: Row(
            children: [
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: const Duration(seconds: 1),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: size.width / 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                        ),
                        children: [
                          const TextSpan(text: 'Hi, I\'m '),
                          TextSpan(
                            text: 'Sơn!\n',
                            style: TextStyle(color: Colors.yellow.shade600),
                          ),
                          TextSpan(
                            text: 'Mobile Developer\nin Hanoi.',
                            style: TextStyle(fontSize: size.width / 34, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: const Duration(seconds: 1),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async => await launchUrl(
                              Uri.parse('https://github.com/sownt')),
                          icon: SvgPicture.asset('assets/icons/github.svg'),
                          color: Colors.black,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () async => await launchUrl(
                              Uri.parse('https://www.linkedin.com/in/sownt')),
                          icon:
                              SvgPicture.asset('assets/icons/linkedin-in.svg'),
                          color: Colors.black,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () async => await launchUrl(
                              Uri.parse('mailto:contact@sownt.com')),
                          icon: SvgPicture.asset('assets/icons/at-solid.svg'),
                          color: Colors.black,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () async =>
                              await launchUrl(Uri.parse('https://t.me/sowntt')),
                          icon: SvgPicture.asset('assets/icons/telegram.svg'),
                          color: Colors.black,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () async => await launchUrl(Uri.parse(
                              'https://www.facebook.com/thaison181/')),
                          icon: SvgPicture.asset('assets/icons/facebook.svg'),
                          color: Colors.black,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/avatar.png',
                  width: size.width / 4,
                  height: size.width / 4,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
