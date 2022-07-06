import 'package:flutter/material.dart';
import 'package:linkedin_clone/views/register_page/register_page.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: 100,
          child: Image.asset(
            'lib/assets/linkedin.png',
          ),
        ),
        Wrap(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterPage()));
              },
              child: const Text(
                'Join now',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
