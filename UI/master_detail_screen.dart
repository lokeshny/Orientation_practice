import 'package:flutter/material.dart';
import 'package:orientation_practice/UI/joke_details.dart';
import 'package:orientation_practice/UI/joke_listing.dart';
import '../model/jokes.dart';

class MasterDetailsScreen extends StatefulWidget {
  const MasterDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MasterDetailsScreen> createState() => _MasterDetailsScreenState();
}

class _MasterDetailsScreenState extends State<MasterDetailsScreen> {
  static const int tabletBreakpoint = 600;
    late Joke _selectedJoke;

  Widget _builMobileLayout() {
    return JokeListing(jokeSelectedCallback: (jokeSelected) {
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) {
        return JokeDetails(
          isInTabletLayout: false,
          jokes: jokeSelected,
        );
      }));
    },
        jokeSelected: _selectedJoke


    );
  }

  Widget _builTabletayout() {
    return Row(
      children: [
        Flexible(
            flex: 1,
            child: Material(
              elevation: 13.0,
              child: JokeListing(jokeSelectedCallback: (joke) {
                setState(() {
                  _selectedJoke = joke;
                });
              }, jokeSelected: _selectedJoke),
            )),
        Flexible(
          flex: 1,
            child: JokeDetails(
              isInTabletLayout: true, jokes:_selectedJoke ,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;


    if(orientation==Orientation.portrait && shortestSide<tabletBreakpoint){
      content = _builMobileLayout();
    }else{
      content = _builTabletayout();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: content,
    );
  }
}
