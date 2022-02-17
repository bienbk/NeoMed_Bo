import 'package:flutter/material.dart';
import './text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: "Mật khẩu",
            filled: true,
            fillColor: Colors.white,
            icon: const Icon(
              Icons.lock,
              color: Colors.black,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility, color: Colors.black),
              onPressed: () => setState(() {
                _obscureText = !_obscureText;
              }),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
