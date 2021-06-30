import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class World {
  Map data = {};
  List continents = [];
  List countries = [];
  List favorite = [];
  List favoritesIds = [];

  Future<void> loadJsonDataFromAssetsFile() async {
    print('loadJsonDataFromAssetsFile');
    final String response = await rootBundle.loadString('assets/data.json');
    this.data = await json.decode(response.toString());
  }

  Future<List> getContinents() async {
    await loadJsonDataFromAssetsFile();
    print('111111111111111111');
    var continentsJson = this.data['continents'];
    print(continentsJson);
    await continentsJson.forEach(
        (key, value) => this.continents.add({'key': key, 'name': value}));
    return this.continents;
  }

  Future<List> getCountriesByContinents(String continentKey) async {
    await loadJsonDataFromAssetsFile();
    print('2222222222222222 $continentKey');
    var countriesJson = this.data['countries'];
    // print(countriesJson);
    await countriesJson.forEach((key, value) {
      if (value['continent'] == continentKey) {
        value['fav'] = false;
        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx $value");
        this.countries.add(value);
      }
    });
    return this.countries;
  }

  Future<List> getCountriesByName(String name) async {
    await loadJsonDataFromAssetsFile();
    print('33333333333333333 $name');
    var countriesJson = this.data['countries'];
    // print(countriesJson);
    await countriesJson.forEach((key, value) {
      if (value['name'] == name) {
        print('===================');
        print(value['name']);
        value['fav'] = false;
        this.countries.add(value);
      }
    });
    return this.countries;
  }

  Future<List> addToFavoriteList(String name) async {
    print("addToFavoriteList");
    await loadJsonDataFromAssetsFile();
    print('33333333333333333 $name');
    var countriesJson = this.data['countries'];
    // print(countriesJson);
    await countriesJson.forEach((key, value) {
      if (value['name'] == name) {
        print('===================');
        print(value['name']);
        value['fav'] = true;
        this.favorite.add(value);
      }
    });
    return this.favorite;
  }

  Future<List> getFavoriteList() async {
    return this.favorite;
  }
}
