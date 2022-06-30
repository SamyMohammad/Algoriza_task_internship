import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  Key? formKey;
  VoidCallback? onTap;
  TextEditingController? controller;
  TextStyle? style;
  bool isHidden;
  Function(String value)? onChanged;
  Function(String value)? onFieldSubmitted;
  TextInputType? type;
  String? hintText;
  IconData? suffix;
  IconData? prefix;
  Function()? suffixPressed;
  Color? cursorColor;
  String? Function(String? value)? validator;
  String? labelText;

  DefaultTextField(
      {Key? key,
      this.onTap,
      this.controller,
      this.style,
      required this.isHidden,
      this.onChanged,
      this.onFieldSubmitted,
      this.type,
      this.hintText,
      this.suffix,
      this.prefix,
      this.suffixPressed,
      this.cursorColor,
      this.validator,
      this.labelText,
      this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isHidden,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        key: key,
        controller: controller,
        onChanged: (String value) {},
        // cursorColor: Colors.grey.shade200,
        decoration: InputDecoration(
          filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            focusedErrorBorder: OutlineInputBorder(

                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            labelText: labelText,
            hintStyle: TextStyle(color: Theme.of(context).primaryColor),
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            hintText: hintText,

            // hintText: hintText,
            prefixIcon: Icon(prefix, color: Theme.of(context).primaryColor),
            suffixIcon: InkWell(
              onTap: suffixPressed,
              child: Icon(
                suffix,
                color: Theme.of(context).primaryColor,
              ),
            ),
            contentPadding:
                const EdgeInsetsDirectional.all(21)) // border: InputBorder.none,
        );
  }
}
