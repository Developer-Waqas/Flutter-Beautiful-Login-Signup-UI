import 'package:flutter/material.dart';

import '../../constants/app_colors/app_colors.dart';
import '../../constants/app_style/app_style.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;
  Widget? suffixIcon;
  final String? Function(String?)? onValidate;
  final TextEditingController? formController;

  CustomTextFormFeild

      ({

    super

        .
    key, this.hintText, this.prefixIcon, this.onValidate, this.formController, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: formController,
      style: headingStyle3,
      cursorColor: fieldTextColor,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: headingStyle3,
          fillColor: fillColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: fillColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fillColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconColor: fieldTextColor,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: redColor,
              width: 2,
            ),
          ),
          errorStyle: headingStyle4,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: redColor, width: 2,),
          )
      ),
      validator: onValidate,
    );
  }
}