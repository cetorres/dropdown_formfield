library dropdown_formfield;

import 'package:flutter/material.dart';

class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final bool filled;
  final EdgeInsets contentPadding;
  final Color dropdownColor;
  final TextStyle optionStyle;

  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      AutovalidateMode autovalidate = AutovalidateMode.disabled,
      this.titleText = 'Title',
      this.hintText = 'Select one option',
      this.required = false,
      this.errorText = 'Please select one option',
      this.value,
      this.dataSource,
      this.textField,
      this.valueField,
      this.onChanged,
      this.filled = true,
      this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0),
      this.dropdownColor,
      this.optionStyle,
      InputDecoration decoration = const InputDecoration()})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    decoration: (decoration ?? const InputDecoration())
                        .applyDefaults(
                            Theme.of(state.context).inputDecorationTheme),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        dropdownColor: dropdownColor ??
                            Theme.of(state.context).canvasColor,
                        isExpanded: true,
                        hint: Text(
                          hintText,
                          style: decoration.hintStyle ??
                              TextStyle(color: Colors.grey.shade500),
                        ),
                        value: value == '' ? null : value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dataSource.map((item) {
                          return DropdownMenuItem<dynamic>(
                            value: item[valueField],
                            child: Text(
                              item[textField],
                              overflow: TextOverflow.ellipsis,
                              style:
                                  optionStyle ?? TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText : '',
                    style: decoration.errorStyle
                            .copyWith(fontSize: state.hasError ? 12.0 : 0.0) ??
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
