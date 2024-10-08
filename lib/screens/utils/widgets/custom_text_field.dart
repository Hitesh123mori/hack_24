import 'package:flutter/material.dart';

import '../color.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final TextEditingController? controller;
  final bool isNumber;
  final FormFieldValidator<String>? validator;
  final String? initialText;
  final Icon prefixicon;
  final bool obsecuretext;
  final IconButton? suffix;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    required this.isNumber,
    this.validator,
    this.initialText,
    this.onSaved,
    required this.prefixicon,
    required this.obsecuretext,
    this.suffix, this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: TextFormField(
          cursorColor: AppColors.theme['primaryColor'],
          onSaved: onSaved,
          onChanged: onChange,
          obscureText: obsecuretext,
          initialValue: initialText,
          keyboardType: isNumber ? TextInputType.number : TextInputType.emailAddress,
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.theme['secondaryColor'],
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.theme['primaryColor']),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.theme['primaryColor']),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.theme['primaryColor']!),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: AppColors.theme['fontColor']!.withOpacity(0.5)),
              prefixIcon: prefixicon,
              prefixIconColor: AppColors.theme['fontColor'],
              suffixIcon: suffix,
              suffixIconColor:AppColors.theme['fontColor']
          ),
          validator: validator,
        ),
      ),
    );
  }
}