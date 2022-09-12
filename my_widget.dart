import 'package:flutter/material.dart';

class MyWidgets {
  static Widget dropDownWidget(
    BuildContext context,
    String hintText,
    dynamic value,
    List<dynamic> lstData,
    Function onChanged,
    Function onValidate, {
    double hintFontSize = 15,
    Color borderColor = Colors.redAccent,
    double borderRadius = 30,
    Color borderFocusColor = Colors.redAccent,
    double paddingLeft = 20,
    double paddingRight = 20,
    double paddingTop = 0,
    double paddingBottom = 0,
    String optionValue = "id",
    String optionLabel = "name",
    double contentPadding = 6,
    Color validationColor = Colors.redAccent,
    Color textColor = Colors.black,
    Color hintColor = Colors.black,
    double borderWidth = 2,
    double focusedBorderWidth = 2,
    double enabledBorderWidth = 1,
    Widget? suffixIcon,
    Icon? prefixIcon,
    bool showPrefixIcon = false,
    Color prefixIconColor = Colors.redAccent,
    double prefixIconPaddingLeft = 30,
    double prefixIconPaddingRight = 10,
    double prefixIconPaddingTop = 0,
    double prefixIconPaddingBottom = 0,
  }) {
    if (value != "") {
      var findValue = lstData
          .where((item) => item[optionValue].toString() == value.toString());

      if (findValue.length > 0) {
        value = findValue.first[optionValue].toString();
      } else {
        value = null;
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
        top: paddingTop,
        bottom: paddingBottom,
      ),
      child: FormField<dynamic>(
        builder: (FormFieldState<dynamic> state) {
          return DropdownButtonFormField<String>(
            isExpanded: true,
            value: value != "" ? value : null,
            isDense: true,
            hint: Text(
              hintText,
              style: TextStyle(
                fontSize: hintFontSize,
              ),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(contentPadding),
              errorStyle: TextStyle(
                color: validationColor,
              ),
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: hintFontSize,
                color: hintColor,
              ),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor,
                  width: enabledBorderWidth,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderFocusColor,
                  width: focusedBorderWidth,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              suffixIcon: suffixIcon,
              prefixIcon: showPrefixIcon
                  ? Padding(
                      child: IconTheme(
                        data: IconThemeData(color: prefixIconColor),
                        child: prefixIcon!,
                      ),
                      padding: EdgeInsets.only(
                        left: prefixIconPaddingLeft,
                        right: prefixIconPaddingRight,
                        top: prefixIconPaddingTop,
                        bottom: prefixIconPaddingBottom,
                      ),
                    )
                  : null,
            ),
            onChanged: (newValue) {
              state.didChange(newValue);
              return onChanged(newValue);
            },
            validator: (value) {
              return onValidate(value);
            },
            items: lstData.map<DropdownMenuItem<String>>(
              (dynamic data) {
                return DropdownMenuItem<String>(
                  value: data[optionValue].toString(),
                  child: Text(
                    data[optionLabel],
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
