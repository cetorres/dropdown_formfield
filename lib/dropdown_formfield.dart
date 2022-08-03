library dropdown_formfield;

import 'package:dropdown_formfield/dropdown_menu_button.dart';
import 'package:flutter/material.dart';

class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final bool enabled;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final bool filled;
  final EdgeInsets contentPadding;
  final InputDecoration decoration;
  final TextStyle hintStyle;
  final TextStyle errorStyle;

  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      AutovalidateMode autovalidate = AutovalidateMode.disabled,
      this.titleText = 'Title',
      this.hintText = 'Select one option',
      this.hintStyle,
      this.required = false,
      this.enabled = true,
      this.errorText = 'Please select one option',
      this.errorStyle,
      this.value,
      this.dataSource,
      this.textField,
      this.valueField,
      this.onChanged,
      this.filled = true,
      this.decoration,
      this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0)})
      : super(
          onSaved: onSaved,
          enabled: enabled,
          validator: validator,
          autovalidateMode: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    decoration: decoration ??
                        InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                          labelText: titleText,
                          filled: true,
                        ),
                    child: DropdownButtonHideUnderline(
                     child: !enabled
                          ? IgnorePointer(
                              child: DropdownMenuButton(
                                  hintText: hintText,
                                  hintStyle: hintStyle,
                                  value: value,
                                  state: state,
                                  onChanged: onChanged,
                                  dataSource: dataSource,
                                  valueField: valueField,
                                  iconField: iconField,
                                  textField: textField,
                                  enabled: enabled),
                            )
                          : DropdownMenuButton(
                              hintText: hintText,
                              hintStyle: hintStyle,
                              value: value,
                              state: state,
                              onChanged: onChanged,
                              dataSource: dataSource,
                              valueField: valueField,
                              iconField: iconField,
                              textField: textField,
                              enabled: enabled),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText : '',
                    style: errorStyle ??
                        TextStyle(
                            color: Colors.redAccent.shade700,
                            fontSize: state.hasError ? 12.0 : 0.0),
                  ),
                ],
              ),
            );
          },
        );
}
