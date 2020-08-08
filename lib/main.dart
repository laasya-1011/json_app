import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('json app'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/person.json'),
              builder: (context, snapshot) {
                var mydata = JSON.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Name :' + mydata[index]['name']),
                          Text('Age :' + mydata[index]['age']),
                          Text('Height :' + mydata[index]['height']),
                          Text('Gender :' + mydata[index]['gender']),
                          Text('Haircolor :' + mydata[index]['hair_color']),
                        ],
                      ),
                    );
                  },
                  itemCount: mydata = null ? 0 : mydata.length,
                );
              },
            ),
          ),
        ));
  }
}
