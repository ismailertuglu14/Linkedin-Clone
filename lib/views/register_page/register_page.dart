import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:linkedin_clone/views/landing_page/landing_page.dart';
import 'package:linkedin_clone/views/landing_page/widgets/appbar.dart';
import 'package:linkedin_clone/views/landing_page/widgets/input_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool isEmailFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                height: 50,
                width: 100,
                child: Image.asset('lib/assets/linkedin.png'),
              ),
              const Text(
                'Join LinkedIn',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                    text: 'or',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                          text: ' sign in',
                          style:
                              TextStyle(color: Colors.blue[700], fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LandingPage()));
                            })
                    ]),
              ),
              InputWidget(
                hintText: 'Email or Phone*',
                controller: _emailController,
              ),
              isEmailFilled == true
                  ? InputWidget(
                      hintText: 'Password', controller: _passwordController)
                  : const SizedBox(),
              ButtonWidget(
                  text: 'Continue',
                  bgColor: Colors.blue[800],
                  onClicked: () {
                    setState(() {
                      isEmailFilled = true;
                    });
                  }),
              isEmailFilled != true ? const DividerWidget() : SizedBox(),
              isEmailFilled != true
                  ? ButtonWidget(
                      text: 'Continue with Google',
                      bgColor: Colors.white,
                      img: 'lib/assets/google.png',
                      textColor: Colors.grey[600],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
