library dropdown_formfield;

import 'package:flutter/material.dart';

class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final AlignmentGeometry textAlign;
  final Color backgroundColor;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final bool filled;
  final EdgeInsets contentPadding;

  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      AutovalidateMode autovalidate = AutovalidateMode.disabled,
      this.titleText = 'Title',
      this.hintText = 'Select one option',
      this.textAlign = Alignment.centerLeft,
      this.backgroundColor = Colors.grey,
      this.required = false,
      this.errorText = 'Please select one option',
      this.value,
      this.dataSource,
      this.textField,
      this.valueField,
      this.onChanged,
      this.filled = true,
      this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0)})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          titleText,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        alignment: textAlign,
                      ),
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<dynamic>(
                            isExpanded: true,
                            hint: Container(
                              alignment: textAlign,
                              child: Text(
                                hintText,
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ),
                            value: value == '' ? null : value,
                            onChanged: (dynamic newValue) {
                              state.didChange(newValue);
                              onChanged(newValue);
                            },
                            items: dataSource.map((item) {
                              return DropdownMenuItem<dynamic>(
                                value: item[valueField],
                                child: Container(
                                  alignment: textAlign,
                                  child: Text(item[textField],
                                      overflow: TextOverflow.ellipsis),
                                ),
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
                ),
              ),
            );
          },
        );
}
