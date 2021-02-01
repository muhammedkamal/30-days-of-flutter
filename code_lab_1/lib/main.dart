import 'package:code_lab_1/names_list.dart';
import 'package:code_lab_1/saved_list.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _saved = Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StartUp Name Generator',
      home: HomeScreen(saved: _saved),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        accentColor: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
    @required Set<WordPair> saved,
  })  : _saved = saved,
        super(key: key);

  final Set<WordPair> _saved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartUp Name Generator'),
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return SavedPage(_saved);
                  }),
                );
              }),
        ],
      ),
      body: Center(
        child: RandomNamesList(_saved),
      ),
    );
  }
}
