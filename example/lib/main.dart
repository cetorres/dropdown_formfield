import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

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
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
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
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  backgroundColor: Colors.grey.shade200,
                  textAlign: Alignment.centerRight,
                  titleText: 'الفئة الريسية',
                  hintText: 'اختر واحدة',
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
                  dataSource: [
                    {
                      "display": "واحد",
                      "value": "1",
                    },
                    {
                      "display": "اثنان",
                      "value": "2",
                    },
                    {
                      "display": "ثلاثة",
                      "value": "3",
                    },
                    {
                      "display": "اربعة",
                      "value": "4",
                    },
                    {
                      "display": "خمسة",
                      "value": "5",
                    },
                    {
                      "display": "ستة",
                      "value": "6",
                    },
                    {
                      "display": "سبعة",
                      "value": "7",
                    },
                  ],
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
