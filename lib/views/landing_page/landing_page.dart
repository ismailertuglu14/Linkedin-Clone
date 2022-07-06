import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/appbar.dart';
import 'widgets/input_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Appbar(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              InputWidget(
                hintText: 'Email or Phone',
                controller: _emailController,
              ),
              InputWidget(
                hintText: 'Password',
                isPassword: true,
                controller: _passwordController,
              ),
              //Remember Me Section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  RichText(
                    text: TextSpan(
                        text: 'Remember me.',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          TextSpan(
                              text: ' Learn more',
                              style: TextStyle(
                                  color: Colors.blue[700], fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                })
                        ]),
                  ),
                ],
              ),
              Text(
                'Forgot password?',
                style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              // Continue Button
              ButtonWidget(
                text: 'Continue',
                bgColor: Colors.blue[900],
                textColor: Colors.white,
              ),
              // or divider
              const DividerWidget(),
              const ButtonWidget(
                text: 'Sign in with Google',
                bgColor: Colors.white,
                textColor: Colors.grey,
                img: 'lib/assets/google.png',
              ),
              const ButtonWidget(
                text: 'Sign in with Apple',
                bgColor: Colors.white,
                textColor: Colors.grey,
                img: 'lib/assets/apple.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: Colors.grey[500],
          height: 22,
        )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "or",
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
        ),
        Expanded(
            child: Divider(
          color: Colors.grey[500],
          height: 22,
        )),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final String? img;
  final Color? textColor;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.bgColor,
    this.img,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Colors.black),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(bgColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              img != null
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        img.toString(),
                      ),
                    )
                  : const SizedBox(),
              Text(
                text, // Text from constructor
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
