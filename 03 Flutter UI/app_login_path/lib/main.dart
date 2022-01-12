import 'package:app_login_path/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: Colors.white, onPrimary: const Color(0xffE62F16))),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final TextStyle textStyleDefault = TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold);

    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffE62F16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/path_logo.png'),
              Text('Beautiful, Private Sharing',
                  style: textStyleDefault),
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: style,
                        onPressed: () {},
                        child: Text('Sign Up', style: DamStyle.textTitleCustom(DamStyle.primaryColor, DamStyle.textSizeSmall)),
                      ),
                    ),
                    Text(''),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: style,
                        onPressed: () {},
                        child: const Text('Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
