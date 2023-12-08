import 'package:flutter/material.dart';
import 'package:flutter_bank/shared/themes.dart';

// ignore: must_be_immutable
class CustomFormFieldPassword extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyboardType;

  CustomFormFieldPassword({
    super.key,
    required this.title,
    this.controller,
    this.isShowTitle = true,
    this.keyboardType,
  });

  @override
  State<CustomFormFieldPassword> createState() =>
      _CustomFormFieldPasswordState();
}

class _CustomFormFieldPasswordState extends State<CustomFormFieldPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isShowTitle)
          Text(
            widget.title,
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
        //
        if (widget.isShowTitle) const SizedBox(height: 8),
        //TEXT_FORM_FIELD
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: !widget.isShowTitle ? widget.title : null,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
