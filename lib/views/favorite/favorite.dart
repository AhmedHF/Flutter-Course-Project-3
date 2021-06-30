import 'package:flutter/material.dart';
import 'package:project_3/api/world.dart';
import 'package:project_3/views/countries/countries.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  var world = World();
  List<dynamic> favorites = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var _favorites = await world.getFavoriteList();
    setState(() {
      favorites = _favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            favorites.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            leading: Text((index + 1).toString()),
                            title: Text(favorites[index]['name']),
                            // subtitle: Text(favorites[index]['name']),
                            trailing: Text(favorites[index]['key']),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CountriesInContinents(
                                        continent: favorites[index]),
                                  ));
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Center(child: Text("There in no items in favorite")),
          ],
        ),
      ),
    );
  }
}
