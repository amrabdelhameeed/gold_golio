import 'package:flutter/material.dart';
import 'package:gold_golio/core/app_colors.dart';

// Updated by Baly
class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({
    Key? key,
    required this.hint,
    this.controller,
    this.inputType,
    this.isPassword = false,
    this.validationText,
    this.radius = 20,
  }) : super(key: key);
  final String hint;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool isPassword;
  final String? validationText;
  final double radius;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isPass;

  IconData suffix = Icons.visibility_off_outlined;

  @override
  void initState() {
    isPass = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isPass,
        keyboardType: widget.inputType,
        style: const TextStyle(
          color: AppColors.formFontColor,
        ),
        validator: (error) {
          if (widget.controller!.text.isEmpty) {
            return widget.validationText;
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    setState(() {
                      isPass = !isPass;
                      suffix = isPass == false
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined;
                    });
                  },
                  child: Icon(suffix),
                )
              : const SizedBox(),
          contentPadding: const EdgeInsets.all(20.0),
          hintText: widget.hint,
          errorStyle: const TextStyle(
            fontFamily: 'SFPro',
          ),
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(
            fontSize: 15.0,
            color: AppColors.formFontColor,
          ),
          errorBorder: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
// widget.isPassword! ? showPass : false