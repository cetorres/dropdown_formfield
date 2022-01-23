library dropdown_formfield;

import 'package:flutter/material.dart';

class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final AlignmentGeometry textAlign;
  final Color backgroundColor;
  final Color titleBackgroundColor;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final bool filled;

  DropDownFormField({
    FormFieldSetter<dynamic> onSaved,
    FormFieldValidator<dynamic> validator,
    AutovalidateMode autovalidate = AutovalidateMode.disabled,
    this.titleText = 'Title',
    this.hintText = 'Select one option',
    this.textAlign = Alignment.centerLeft,
    this.backgroundColor = Colors.white70,
    this.titleBackgroundColor = Colors.white70,
    this.required = false,
    this.errorText = 'Please select one option',
    this.value,
    this.dataSource,
    this.textField,
    this.valueField,
    this.onChanged,
    this.filled = true,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                color: backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Container(
                        color: titleBackgroundColor,
                        width: double.infinity,
                        alignment: textAlign,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                          child: Text(
                            titleText,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 8.0, 0, 8.0),
                                    child: Text(item[textField],
                                        textDirection: TextDirection.rtl,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
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
            );
          },
        );
}
