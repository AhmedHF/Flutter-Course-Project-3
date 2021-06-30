import 'package:flutter/material.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:developer';

import 'package:project_3/api/world.dart';
import 'package:project_3/views/countries/countries.dart';

class HomeDetalis extends StatefulWidget {
  const HomeDetalis({Key? key}) : super(key: key);

  @override
  _HomeDetalisState createState() => _HomeDetalisState();
}

class _HomeDetalisState extends State<HomeDetalis> {
  var world = World();
  List<dynamic> continents = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var _continents = await world.getContinents();
    setState(() {
      continents = _continents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            continents.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: continents.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            leading: Text((index + 1).toString()),
                            title: Text(continents[index]['name']),
                            // subtitle: Text(continents[index]['name']),
                            trailing: Text(continents[index]['key']),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CountriesInContinents(
                                        continent: continents[index]),
                                  ));
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
