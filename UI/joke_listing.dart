import 'package:flutter/material.dart';

import '../model/jokes.dart';

class JokeListing extends StatelessWidget {

  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke jokeSelected;
     JokeListing({Key? key, required this.jokeSelectedCallback, required this.jokeSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokeList.map( (joke){
return Container(
  child: ListTile(
    title: Text(joke.setup),
    onTap: ()=>jokeSelectedCallback,
    selected: jokeSelected == joke,
  ),
);
      }).toList(),
    );
  }
}
