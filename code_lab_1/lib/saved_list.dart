import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  final Set<WordPair> saved;
  SavedPage(this.saved);
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<WordPair> _names;
  @override
  void initState() {
    _names = widget.saved.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Names'),
      ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return _buildListItem(index);
        },
        itemCount: widget.saved.length,
      ),
    );
  }

  Column _buildListItem(int index) {
    return Column(
      children: [
        ListTile(
          title: Text(
            _names[index].asPascalCase,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Divider(),
      ],
    );
  }
}
