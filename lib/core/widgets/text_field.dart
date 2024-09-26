// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rideshare_/widgets.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFD0D0D0),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            )),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyPhoneField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  MyPhoneField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Expanded(
        child: IntlPhoneField(
          initialCountryCode: 'SY',
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFFD0D0D0),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  TextEditingController controller;
  bool visable;
  String hintText;
  PasswordTextField({
    super.key,
    required this.controller,
    required this.visable,
    required this.hintText,
  });
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      obscureText: widget.visable,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFD0D0D0),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        suffixIcon: togglePassword(widget.visable, (newValue) {
          setState(() {
            widget.visable = newValue;
          });
        }),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
