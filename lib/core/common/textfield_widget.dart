/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color color;
  final int maxLines;
  final TextStyle labelStyle;
  final FocusNode focusNode;
  final Function requestFocus;
  final Function validator;
  final Function onChanged;
  final Widget suffixIcon;
  final bool isError;
  final bool obscureText;
  final textInputType;
  final textInputAction;
  final bool enabled;
  final String hintText;
  final TextStyle hintStyle;
  final bool showBorderColor;
  final int maxLength;
  final bool allowOnlyDigits;
  final bool restrictSpecialChar;
  final bool enableInteractiveSelection;
  final bool restrictDigits;
  final bool restrictSpecialAndSpace;

  UiInputField(
      {required this.controller,
        this.label = "Input Label",
        this.color = Colors.white,
        required this.suffixIcon,
        this.maxLines = 1,
        required this.labelStyle,
        required this.focusNode,
        required this.requestFocus,
        required this.validator,
        this.obscureText = false,
        required this.onChanged,
        this.isError = false,
        this.textInputType,
        this.textInputAction,
        this.enabled = true,
        required this.hintText,
        required this.hintStyle,
        this.showBorderColor = false,
        this.maxLength = 400,
        this.allowOnlyDigits = false,
        this.restrictDigits = false,
        this.restrictSpecialChar = false,
        this.restrictSpecialAndSpace = false,
        this.enableInteractiveSelection = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 17.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        border: isError
            ? Border.all(
          color: kErrorColor,
        )
            : showBorderColor
            ? Border.all(
          width: 1.0,
          color: enabled ? kGrey05 : kGrey20,
        )
            : null,
        boxShadow: [
          // BoxShadow(
          //   color: kShadowColor1,
          //   blurRadius: 3.0,
          //   spreadRadius: 1.0, // soften the shadow
          // )
        ],
      ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              label,
              textScaleFactor: 1.0,
              style: labelStyle,
              //textAlign: TextAlign.left,
            ),
            const SizedBox(height: 3),
            TextFormField(
              inputFormatters: [
                if(restrictDigits)
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),

                if (allowOnlyDigits)
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                if(restrictSpecialChar) //space also allowed
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]")),

                if(restrictSpecialAndSpace) //space also allowed
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),

                LengthLimitingTextInputFormatter(
                    maxLength), //will restrict the textformfield without showing on ui
              ],
              style: TextStyle(weight: FONTWEIGHT.light)
                  .copyWith(color: kDropDownHintTextColor),
              enableInteractiveSelection: enableInteractiveSelection,
              enabled: enabled,
              controller: controller,

              maxLines: maxLines,
              focusNode: focusNode,
              keyboardType: textInputType ?? TextInputType.text,

              textInputAction: textInputAction ?? TextInputAction.done,
              onTap: () {
                // requestFocus(focusNode);
              },
              obscureText: obscureText,
              onChanged: onChanged,
              // validator: validator,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,

                isDense: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                hintStyle: hintStyle,
                //   labelText: label,
                fillColor: Colors.white,
                // labelStyle: labelStyle,
                border: InputBorder.none,
                suffixIcon: suffixIcon,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}*/
