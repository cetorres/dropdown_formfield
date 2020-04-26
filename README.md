
# Material Dropdown form field

A material dropdown form field using a dropdown button inside a form field.
this plugin is improved version of [dropdown_formfield](https://github.com/cetorres/dropdown_formfield) plugin originally developed by [cetorres](https://github.com/cetorres)

## Demo

<img src="https://github.com/shivanshtalwar0/dropdown_formfield/raw/master/screenshot_1.gif" width="300" />

## Features

- Can be used as regular form field.
- Simple to implement.
- Simple and intuitive to use in the app.
- Provides validation of data.
- Provides requirement of the field.
- Follows the app theme and colors.

## Helper Classes for customizing look and feel of dropdownbutton
1. OutlinedDropDownDecoration inherits InputDecoration
2. RoundedDropDownDecoration inherits InputDecoration

## Api and Options
DropDownFormField
    String titleText:-provide labelText
    String hintText:-provide hint 
    bool required:-field required or no
    String errorText:-error text
    dynamic value:-initial source value
    List dataSource:-list of options
    String textField:-field to show text 
    String valueField:-field to target for value
    Function onChanged:-fired when value changes
    bool filled
    FocusNode focusNode
    InputDecoration inputDecoration
    TextStyle innerTextStyle:-inner text style of dropdown
    Color wedgeColor:-dropdown wedge color
    Color disabledWedgeColor:-wedge color to be shown when dropdown disabled
    Icon wedgeIcon:- icon of wedge default:-(Icon(Icons.arrow_drop_down))


## Example

```dart
import 'package:flutter/material.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _myActivity;
  String _myActivityResult;
  FocusNode focusNode = FocusNode();
  final formKey = new GlobalKey<FormState>();
  List dataSource=[
    {
      "display": "Running",
      "value": "Running",
    },
    {
      "display": "Climbing",
      "value": "Climbing",
    },
    {
      "display": "Walking",
      "value": "Walking",
    },
    {
      "display": "Swimming",
      "value": "Swimming",
    },
    {
      "display": "Soccer Practice",
      "value": "Soccer Practice",
    },
    {
      "display": "Baseball Practice",
      "value": "Baseball Practice",
    },
    {
      "display": "Football Practice",
      "value": "Football Practice",
    },
  ];

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
    focusNode.addListener(() {
      focusNode.unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
//      focusNode.
    });
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Formfield Example'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(

                  wedgeIcon: Icon(Icons.keyboard_arrow_down),
                  wedgeColor: Colors.lightBlue,
                  innerTextStyle: TextStyle(color: Colors.blue),
                  focusNode: focusNode,
                  inputDecoration: OutlinedDropDownDecoration(
                      labelStyle: TextStyle(color: Colors.green),
                      labelText: "Welcome to island",
                      borderColor: Colors.purple),
                  hintText: 'Please choose one',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  dataSource: dataSource,
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'My workout',
                  hintText: 'Please choose one',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  dataSource: dataSource,
                  textField: 'display',
                  valueField: 'value',
                ),
              ),

              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  inputDecoration: RoundedDropDownDecoration(labelText:"Welcome to island"),
                  hintText: 'Please choose one',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  dataSource: dataSource,
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivityResult),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```

## License

This project is licensed under the BSD License. See the LICENSE file for details.
