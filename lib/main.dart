// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'connect_api.dart';
import 'search.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  MyStatelessWidget createState() {
    return MyStatelessWidget();
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends State<MyStatefulWidget> {
  // MyStatelessWidget({Key key}) : super(key: key);
  String search = '';

  callback(newSearch) {
    print('callback called $newSearch.');
    search = newSearch;
    setState(() {
      search = newSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter projects'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     tooltip: 'Open shopping cart',
        //     // onPressed: () {
        //     //   Navigator.push(
        //     //     context,
        //     //     MaterialPageRoute(builder: (context) => apiRoute()),
        //     //   );
        //     //   // Implement navigation to shopping cart page here...
        //     //   print('Shopping cart opened.');
        //     // },
        //   ),
        // ],
      ),
      body: Center(
        child: Search(search, callback),
      ),
    );
  }
}