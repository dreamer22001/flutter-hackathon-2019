import 'package:flutter/material.dart';
import 'connect_api.dart';

// Define a Custom Form Widget
class Search extends StatefulWidget {
  String search;
  Function(String) callback;

  Search(this.search, this.callback);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<Search> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  final _searchResult = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter your username',
              contentPadding: const EdgeInsets.all(16.0),
            ),
            controller: _searchResult,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            // child: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.search),
            //     tooltip: 'Open shopping cart',
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => apiRoute()),
            //       );
            //       // Implement navigation to shopping cart page here...
            //       print('Shopping cart opened.');
            //     },
            //   ),
            // ],
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  _toggleSearch();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => apiRoute()),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      )
    );
  }

  void _toggleSearch() {
    String text = _searchResult.text;
    widget.callback('$text');
  }
}