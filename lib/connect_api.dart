
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import 'repo_card.dart';

class User {
  String name;
  int id;
  User({this.name,this.id});
}


Future<List<User>> fetchUsersFromGitHub() async {
  final response = await http.get('https://api.github.com/users');
  print(response.body);
  List responseJson = json.decode(response.body.toString());
  List<User> userList = createUserList(responseJson);
  return userList;
}

List<User> createUserList(List data){
  List<User> list = new List();
  for (int i = 0; i < data.length; i++) {
    String title = data[i]["login"];
    int id = data[i]["id"];
    User user = new User(
        name: title,id: id);
    list.add(user);
  }
  return list;
}

/// This is the stateless widget that the main application instantiates.
class apiRoute extends StatelessWidget {
  apiRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Fetch Data Examplea'),
      ),
      body: new Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new FutureBuilder<List<User>>(
            future: fetchUsersFromGitHub(),
            builder: (context, snapshot) {

              if (snapshot.hasData) {
                return new ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                        return Center(
                            child: Card(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: const Icon(Icons.cloud_download),
                                        title: Text(snapshot.data[index].name),
                                        subtitle: Text('Repo ID is: ${snapshot.data[index].id}'),
                                      ),
                                      new ButtonTheme.bar(
                                          child: new ButtonBar(
                                              children: <Widget>[
                                                new FlatButton(
                                                  child: const Text('Acessar repositório'),
                                                  onPressed: () {
                                                    // _launchURL('https://github.com/${User.name}');
                                                    print('https://github.com/');
                                                  },
                                                )
                                              ]
                                          )
                                      )
                                    ]
                                )
                            )
                        );
                    }
                );
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}