import 'package:flutter/material.dart';
import 'package:project_3/api/world.dart';
import 'package:project_3/model/countryModel.dart';
import 'package:project_3/views/countryDetalis/countryDetalis.dart';

class CountriesInContinents extends StatefulWidget {
  final Map continent;
  const CountriesInContinents({Key? key, required this.continent})
      : super(key: key);

  @override
  _CountriesInContinentsState createState() => _CountriesInContinentsState();
}

class _CountriesInContinentsState extends State<CountriesInContinents> {
  bool searchOpen = false;
  List<dynamic> searchData = [];

  var world = World();
  List<dynamic> countries = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var _countries =
        await world.getCountriesByContinents(widget.continent['key']);
    setState(() {
      countries = _countries;
    });
  }

  void getSearchData(v) async {
    List _countries = countries
        .where((element) => (element['name'].toLowerCase()).contains(v))
        .toList();
    print(_countries);
    print('///////////////////////');
    setState(() {
      searchData = _countries;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final String encodedData = Country.encode([
    //   Country(
    //       name: 'name',
    //       native: 'native',
    //       phone: 'phone',
    //       continent: 'continent',
    //       capital: 'capital',
    //       currency: 'currency',
    //       languages: ['languages'],
    //       emoji: 'emoji',
    //       emojiU: 'emojiU'),
    //   // countries[0]
    // ]);

    // final List<Country> decodedData = Country.decode(encodedData);

    // print('**************************************************************');
    // print(decodedData);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.continent['name']),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search_sharp),
            tooltip: 'Open shopping cart',
            onPressed: () {
              setState(() {
                searchOpen = !searchOpen;
              });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          searchOpen
              ? TextFormField(
                  onChanged: (v) => getSearchData(v),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                    ),
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your country name',
                  ))
              : Container(),
          (searchData.length > 0 && searchOpen)
              ? Expanded(
                  child: ListView.builder(
                    itemCount: searchData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Text((index + 1).toString()),
                          title: Text(searchData[index]['name']),
                          // subtitle: Text(continents[getName(index)]),
                          trailing: Icon(Icons.favorite),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CountryDetails(
                                      country: searchData[index]),
                                ));
                            // Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                )
              : countries.length > 0
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          // print('xxxxxxxxxxxxxxxx ');
                          // print(continents[index]);
                          // print(index);
                          return Card(
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Text((index + 1).toString()),
                              title: Text(countries[index]['name']),
                              // subtitle: Text(continents[getName(index)]),
                              trailing: IconButton(
                                  icon: (Icon(countries[index]['fav']
                                      ? Icons.favorite
                                      : Icons.favorite_outline_outlined)),
                                  onPressed: () => world.addToFavoriteList(
                                      countries[index]['name'])),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CountryDetails(
                                          country: countries[index]),
                                    ));
                                // Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
