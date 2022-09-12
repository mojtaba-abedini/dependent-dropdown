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

      if (findValue.isNotEmpty) {
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
          return Container(
            margin: const EdgeInsets.only(top: 5),
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset:
                    const Offset(0, 2), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownButton<String>(
                isExpanded: true,
                value: value != "" ? value : null,
                isDense: true,
                hint: Text(
                  hintText,
                  style: TextStyle(
                    fontSize: hintFontSize,
                  ),
                ),

                onChanged: (newValue) {
                  state.didChange(newValue);
                  return onChanged(newValue);
                },

                items: lstData.map<DropdownMenuItem<String>>(
                      (dynamic data) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.centerRight,
                      value: data[optionValue].toString(),
                      child: Text(
                        data[optionLabel],
                        style: const TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    );
                  },
                ).toList(),
                underline: Container(),
              ),
            ),
          );
        },
      ),
    );
  }
}
