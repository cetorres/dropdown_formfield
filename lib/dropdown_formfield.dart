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
  final bool outlined;
  final bool rounded;
  final InputDecoration inputDecoration;


  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      bool autovalidate = false,
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
        this.inputDecoration,
        this.outlined,
        this.rounded
      })
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidate: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            if (outlined == null && rounded == null) {
              inputDecoration = InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                labelText: titleText,
                filled: filled,
              );
            } else {
              assert(outlined ==
                  rounded, "rounded and outlined must never be equal", );
              if (rounded) {
                inputDecoration = InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 14,
                    textBaseline: TextBaseline.ideographic,
                  ),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25)),
                  border: OutlineInputBorder(
                      gapPadding: 1,
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  labelText: titleText,
                  filled: filled,
                );
              } else if (outlined) {
                inputDecoration = InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 14,
                    textBaseline: TextBaseline.ideographic,
                  ),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(0)),
                  border: OutlineInputBorder(
                      gapPadding: 1,
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(0)),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  labelText: titleText,
                  filled: filled,
                );
              }
            }

            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    decoration: inputDecoration,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        hint: Text(
                          hintText,
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        value: value == '' ? null : value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dataSource.map((item) {
                          return DropdownMenuItem<dynamic>(
                            value: item[valueField],
                            child: Text(item[textField]),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText : '',
                    style: TextStyle(color: Colors.redAccent.shade700, fontSize: state.hasError ? 12.0 : 0.0),
                  ),
                ],
              ),
            );
          },
        );
}
