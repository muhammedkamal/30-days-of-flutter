import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomNamesList extends StatefulWidget {
  final Set<WordPair> saved;
  RandomNamesList(this.saved);
  @override
  _RandomNamesListState createState() => _RandomNamesListState();
}

class _RandomNamesListState extends State<RandomNamesList> {
  final List<WordPair> _names = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, int index) {
        if (index >= _names.length) {
          _names.addAll(generateWordPairs().take(10));
        }
        return _buildListItem(index);
      },
    );
  }

  Column _buildListItem(int index) {
    bool _isSaved = widget.saved.contains(_names[index]);
    return Column(
      children: [
        ListTile(
          title: Text(
            _names[index].asPascalCase,
            style: TextStyle(fontSize: 18),
          ),
          trailing: IconButton(
            icon: Icon(
              _isSaved ? Icons.favorite : Icons.favorite_border,
              color: _isSaved ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                _isSaved
                    ? widget.saved.remove(_names[index])
                    : widget.saved.add(_names[index]);
              });
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
