library dropdown_formfield;

import 'package:flutter/material.dart';

class RoundedDropDownDecoration extends InputDecoration {

  final double fontSize;
  final String labelText;
  final bool filled;
  final double labelGap;
  final Color borderColor;
  final BorderRadius borderRadius;
  final double borderWidth;

  RoundedDropDownDecoration({
    @required this.labelText,
    this.fontSize,
    this.filled,
    this.labelGap,
    this.borderColor,
    this.borderRadius,
    this.borderWidth})
      :super(labelStyle: TextStyle(
      fontSize: fontSize ?? 14,
      textBaseline: TextBaseline.ideographic),
      focusedBorder: OutlineInputBorder(
          gapPadding: 1,
          borderSide: BorderSide(
              color: Colors.blue,
              width: 3,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(60)),
      border: OutlineInputBorder(
          gapPadding: labelGap ??0,
          borderSide: BorderSide(
              color: borderColor ?? Colors.black,
              width: borderWidth ?? 1,
              style: BorderStyle.solid),
          borderRadius: borderRadius ?? BorderRadius.circular(25)),
      contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
      labelText: labelText ?? "Title",
      filled: filled ?? false);

}

class OutlinedDropDownDecoration extends InputDecoration {

  final double fontSize;
  final String labelText;
  final bool filled;
  final double labelGap;
  final Color borderColor;
  final BorderRadius borderRadius;
  final double borderWidth;

  OutlinedDropDownDecoration({
    @required this.labelText,
    this.fontSize,
    this.filled,
    this.labelGap,
    this.borderColor,
    this.borderRadius,
    this.borderWidth})
      :super(labelStyle: TextStyle(
      fontSize: fontSize ?? 14,
      textBaseline: TextBaseline.ideographic),
      focusedBorder: OutlineInputBorder(
          gapPadding: 2,
          borderSide: BorderSide(
              color: Colors.blue,
              width: 3,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(0)),
      border: OutlineInputBorder(
          gapPadding: labelGap ?? 5,
          borderSide: BorderSide(
              color: borderColor ?? Colors.black,
              width: borderWidth ?? 1,
              style: BorderStyle.solid),
          borderRadius: borderRadius ?? BorderRadius.circular(0)),
      contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
      labelText: labelText ?? "Title",
      filled: filled ?? false);

}



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
  InputDecoration inputDecoration;


  DropDownFormField({FormFieldSetter<dynamic> onSaved,
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
  }) :super(validator: validator,
      onSaved: onSaved,
      autovalidate: autovalidate,
      initialValue: value == '' ? null : value,
      builder: (FormFieldState<dynamic> state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InputDecorator(
                decoration: inputDecoration??InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  labelText: titleText,
                  filled: filled,
                ),
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
                style: TextStyle(color: Colors.redAccent.shade700,
                    fontSize: state.hasError ? 12.0 : 0.0),
              ),
            ],
          ),
        );
      });

}
