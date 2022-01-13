import 'package:flutter/material.dart';
import 'package:flutter_redbull_login/style.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/fondo.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              top: 30,
              right: 30,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: DamStyle.bodyPadding, right: DamStyle.bodyPadding),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text('Skip', style: DamStyle.textTitleCustom(Colors.white, 14),)))),
          Padding(
            padding: const EdgeInsets.all(DamStyle.bodyPadding),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                "assets/images/redbulllogo.png",
                width: 300,
              ),
              Text(
                "Sign in to get the most of",
                style: DamStyle.textTitleCustom(
                    DamStyle.primaryColor, DamStyle.textSizeBig),
              ),
              Text(
                "Red Bull",
                style: DamStyle.textTitleCustom(
                    DamStyle.primaryColor, DamStyle.textSizeBig),
              ),
              Text(
                "Create an account to save favorites and ",
                style: DamStyle.textTitleCustom(
                    DamStyle.primaryColor, DamStyle.textSizeSmall),
              ),
              Text(
                "download videos to watch anytime you want.",
                style: DamStyle.textTitleCustom(
                    DamStyle.primaryColor, DamStyle.textSizeSmall),
              ),
              SizedBox(
                height: 40,
                child: Center(
                    child: SignInButton(
                  Buttons.Google,
                  text: "Continue with Google",
                  onPressed: () {},
                )),
              ),
              SizedBox(
                height: 40,
                child: Center(
                    child: SignInButton(
                  Buttons.Facebook,
                  text: "Continue with Facebook",
                  onPressed: () {},
                )),
              ),
              SizedBox(
                  height: 40,
                  child: Center(
                      child: SignInButton(
                    Buttons.Email,
                    text: "Continue with Email",
                    onPressed: () {},
                  )))
            ]),
          ),
        ]),
      ),
    );
  }
}
