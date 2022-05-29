import 'package:flutter/material.dart';
import 'package:songapp/models/song.dart';

class Player extends StatefulWidget {
  //const Player({Key? key}) : super(key: key);
  late Song song;

  Player(Song song) {
    this.song = song;
    // print(song);
  }

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Name'),
      ),
      body: Column(
        children: [Image.network(widget.song.image)],
      ),
      // child: Expanded(
      //     child: Column(
      //     children: [
      //     Image.network(widget.song.image),
      //     Text(widget.song.trackName),
      //     Text(widget.song.artistName)
      //   ],
      // )),
    );
  }
}
