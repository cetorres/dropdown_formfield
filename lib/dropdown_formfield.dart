library dropdown_formfield;

import 'package:flutter/material.dart';

class DropDownFormField extends FormField<dynamic> {
  /// String value to indicate widget title
  final String titleText;

  /// String value to indicate hint text
  final String hintText;

  /// Boolean value to indicate when the widget value is required
  final bool required;

  /// String value to indicate error text
  final String errorText;

  /// Dynamic value to indicate the initial value for the widget
  final dynamic value;

  /// Dynamic list of values to fill the dropdown list
  final List dataSource;

  /// String value to indicate the field to display from dataSource
  final String textField;

  /// String value to indicate the field to take as value from dataSource
  final String valueField;

  /// Function to call when the dropdown changes its value
  final Function onChanged;

  /// Boolean value to indicate when input is filled by default color
  final bool filled;

  /// Color value to indicate the fill color when filled is true
  final Color filledColor;

  /// Value to stylize the title label
  final TextStyle labelStyle;
  
  /// Value to stylize the hint text
  final TextStyle hintStyle;

  /// Value to indicate the content padding
  final EdgeInsets contentPadding;

  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
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
      this.filledColor = const Color.fromARGB(255, 237, 237, 238),
      this.labelStyle,
      this.hintStyle,
      this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0)})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      labelText: titleText,
                      labelStyle: labelStyle,
                      filled: filled,
                      fillColor: filledColor
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        isExpanded: true,
                        hint: Text(
                          hintText,
                          style: hintStyle??TextStyle(color: Colors.grey.shade500),
                        ),
                        value: value == '' ? null : value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dataSource.map((item) {
                          return DropdownMenuItem<dynamic>(
                            value: item[valueField],
                            child: Text(item[textField],
                                overflow: TextOverflow.ellipsis),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText : '',
                    style: TextStyle(
                        color: Colors.redAccent.shade700,
                        fontSize: state.hasError ? 12.0 : 0.0),
                  ),
                ],
              ),
            );
          },
        );
}
