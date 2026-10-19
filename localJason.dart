import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {runApp(MyApp()); }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Localjson(),
    );
  }
}


class Localjson extends StatefulWidget {
  const Localjson({super.key});

  @override
  State<Localjson> createState() => _LocaljsonState();
}

class _LocaljsonState extends State<Localjson> {

  List _items = [];
  // fetch content from local json file
  Future<void> readjsson() async{
    final String response = await
      rootBundle.loadString(('assets/sample.json'));

    // convert data into
    final data = await jsonDecode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local json fetch'),
      ),
      body: Padding(padding: EdgeInsets.all(25),
        child: ElevatedButton(onPressed: () {
          // display the daa loaded from sample.json
          _items.isNotEmpty ?
            Expanded(child:
              ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, idx) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child:  ListTile(
                    leading: Text(_items[idx]['idx']),
                    title: Text(_items[idx]['name']),
                    subtitle: Text(_items[idx]['description']),
                  ),
                  );
                },
              ),
          ) : Container();
        },
        child: Text('click to fectch data')),
      ),
    )
    ;
  }
}
