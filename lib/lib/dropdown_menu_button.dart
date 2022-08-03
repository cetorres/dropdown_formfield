import 'package:flutter/material.dart';

class DropdownMenuButton extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final value;
  final FormFieldState state;
  final Function onChanged;
  final List dataSource;
  final String valueField;
  final String iconField;
  final String textField;
  final bool enabled;

  const DropdownMenuButton(
      {Key key,
      this.hintText,
      this.hintStyle,
      this.value,
      this.state,
      this.onChanged,
      this.dataSource,
      this.valueField,
      this.iconField,
      this.textField,
      this.enabled})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      hint: Text(
        hintText,
        style: hintStyle ?? TextStyle(color: Colors.grey.shade600),
      ),
      value: value == '' ? null : value,
      iconEnabledColor: !enabled
          ? Colors.grey.shade500
          : Theme.of(context).textTheme.bodyText1.color,
      onChanged: (dynamic newValue) {
        state.didChange(newValue);
        onChanged(newValue);
      },
      items: dataSource.map((item) {
        return DropdownMenuItem<dynamic>(
          value: item[valueField],
          child: (iconField != null && iconField.isNotEmpty
              ? Row(
                  children: <Widget>[
                    item[iconField],
                    const SizedBox(width: 5),
                    Text(item[textField])
                  ],
                )
              : Text(item[textField])),
        );
      }).toList(),
    );
  }
}
