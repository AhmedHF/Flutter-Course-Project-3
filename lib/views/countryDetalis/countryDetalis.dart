import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  final Map country;
  const CountryDetails({Key? key, required this.country}) : super(key: key);

  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  List<Widget> textLanguagesList = [];
  getLanguages() {
    print(widget.country['languages'].length);
    print('aaaaaaaaaaaaaa');
    widget.country['languages'].forEach((item) {
      textLanguagesList.add(Text(item + ', '));
    });
  }

  @override
  void initState() {
    super.initState();
    getLanguages();
  }

  // value.forEach((item) => Text(item))
  renderRow(key, value) {
    return Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).unselectedWidgetColor, width: 2),
              ),
              child: Center(child: Text(key)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).unselectedWidgetColor, width: 2),
              ),
              child: key == 'languages'
                  ? Row(
                      children: textLanguagesList,
                    )
                  : Text(value),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.country['name']),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          renderRow('name', widget.country['name']),
          renderRow('native', widget.country['native']),
          renderRow('phone', widget.country['phone']),
          renderRow('continent', widget.country['continent']),
          renderRow('capital', widget.country['capital']),
          renderRow('currency', widget.country['currency']),
          renderRow('languages', widget.country['languages']),
          renderRow('emoji', widget.country['emoji']),
          renderRow('emojiU', widget.country['emojiU']),
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
