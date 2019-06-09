import 'dart:async';

import 'package:flutter/material.dart';
import 'package:train_app/models/trainData.dart';
import 'package:train_app/bloc/trainbloc.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TrainBloc bloc = TrainBloc();
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              controller: _editingController,
              decoration: InputDecoration(labelText: "Train Number"),
            ),
            StreamBuilder(
                stream: bloc.stream,
                builder: (context, AsyncSnapshot<TrainList> snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.connectionState == ConnectionState.active) {
                    print("1");
                    if (snapshot.data.data.name == null) {
                      print("2");
                      return Expanded(
                        child: Center(
                          child: Text("Error Occured"),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.active &&
                        snapshot.hasData) {
                      print("3");
                      print(snapshot.connectionState);
                      return Column(
                        children: <Widget>[
                          Text("Name:${snapshot.data.data.name}"),
                          Text("Number:${snapshot.data.data.number}")
                        ],
                      );
                    }
                  } else {
                    print("4");
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (_editingController.text == null || _editingController.text == "") {
          print("Enter correct text");
        } else {
          bloc.getTrainData(_editingController.text);
        }
        Timer(Duration(seconds: 4), callback);
      }),
    );
  }

  void callback() {
    _editingController.text = "";
  }
}
