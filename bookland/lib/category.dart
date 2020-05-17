import 'dart:convert';
//import 'dart:html';

import 'package:bookland/services/globalVariable.dart';
import 'package:bookland/user_account.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bookland/login.dart';
import 'package:bookland/explore.dart';
import 'package:bookland/list_dynamic.dart';
import 'package:bookland/bookview.dart';
import 'package:bookland/category.dart';
import 'package:bookland/adminAddBook.dart';
import 'dart:convert';
import 'package:bookland/adminOrders.dart';

import 'package:bookland/services/HTTP.dart';


class NT extends StatelessWidget {
  final HTTPAll httpall = HTTPAll();
  final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.orange,Colors.indigo, Colors.purple,Colors.pink,Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.orange,Colors.indigo,Colors.purple,Colors.pink,Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.orange,Colors.indigo,Colors.purple,Colors.pink];

  @override
  Widget build(BuildContext context) {
    final title = 'Category';

    return MaterialApp(
      title: title,

      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        backgroundColor: Colors.black,

        body: FutureBuilder(

          future: httpall.getCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if (snapshot.hasData) {

              print("snapshot has data");
              //Book returnedBook = snapshot.data;
              print(snapshot.data.toString());
              List<dynamic>  lists = json.decode(snapshot.data.toString());
              print(lists);
              int index = 0;
              //return Text(snapshot.data.bookName);
              return GridView.count( // https://flutter-examples.com/flutter-change-listview-to-gridview/
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,

                // Generate 100 widgets that display their index in the List.
                  children: lists.map((data) => GestureDetector(
                          onTap: (){
                            // TODO BURADAN LİSTELERE BAĞLANACAK
                            Navigator.push(
                              context,
                              new MaterialPageRoute(builder: (context) => new List_DynamicStateless(-1,data.toString())),
                            );
                          },
                          child: Container(
                              margin:EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                             // color: Colors.orangeAccent,

                              color: colors[index++],
                              child: Center(
                                  child: Text(data,
                                      style: TextStyle(fontSize: 22, color: Colors.white),
                                      textAlign: TextAlign.center)
                              )))
                  ).toList(),
                );

            } else if (snapshot.hasError) {
              print("Snapshot has error*");
              return Text("${snapshot.error}");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }



}
