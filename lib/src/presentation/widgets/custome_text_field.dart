import 'package:flutter/material.dart';
import 'package:jumpapp/src/config/size_config/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String?)? save;
  final bool? obscureText,enabled;
  final TextInputType? type;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool filled;
  final OutlineInputBorder focusedBorder;
  final OutlineInputBorder enabledBorder;
  final OutlineInputBorder errorBorder;
  final Widget? prefixIcon,suffixIcon;

  const CustomTextField(
      {Key? key,
      this.hint,
      this.save,
      this.validator,
      this.suffixIcon,
      this.filled = false,
      this.obscureText = false,
      this.type,
      this.prefixIcon,
      this.controller,
      this.onChanged,
      this.focusedBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      this.enabledBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 0.0),
      ),
      this.errorBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
      this.focusNode,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.07,
      child:  TextFormField(
          style: const TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
          onChanged: onChanged,
          focusNode: focusNode,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
              filled: filled,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.blue, fontWeight: FontWeight.normal),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hint,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              errorBorder: errorBorder),
          keyboardType: type,
          validator: validator,
          onSaved: save,
          enabled: enabled),
    );
  }
}
