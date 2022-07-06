import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  const InputWidget({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: widget.isPassword == true
                ? Icon(
                    isObscure == true
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
