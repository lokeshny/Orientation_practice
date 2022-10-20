import 'package:flutter/material.dart';

import '../model/jokes.dart';


class JokeDetails extends StatelessWidget {


  final bool isInTabletLayout;
  final Joke jokes;


  JokeDetails({required this.isInTabletLayout, required this.jokes});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(jokes.setup ?? 'No joke selected',
          style: textTheme.headline1,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(jokes.punchLine ?? 'Please select joke on the left',style: textTheme.subtitle1,),
        )
      ],
    );

    if(isInTabletLayout){
      return Center(
        child: content,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(jokes?.type ?? 'NO joke'),
      ),
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(child: content,),
    );
  }
}
