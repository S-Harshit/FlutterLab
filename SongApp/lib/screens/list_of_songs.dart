import 'package:flutter/material.dart';
import 'package:songapp/config/constants/app_constants.dart';
import 'package:songapp/screens/player.dart';
import 'package:songapp/models/song.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:shake/shake.dart';
import 'package:songapp/utils/services/api_client.dart';

class ListOfSongs extends StatefulWidget {
  ListOfSongs({Key? key}) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  List<Song> songs = [];
  bool songstatus = false;
  late int songIndex;
  late String currentlyPlaying;
  AudioPlayer audioPlayer = AudioPlayer();

//...
//...
  dynamic error;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiClient client = ApiClient();
    client.getSongs(getSongList, getError);
  }

  getSongList(List<Song> songs) {
    this.songs = songs;
    setState(() {});
  }

  getError(dynamic error) {
    this.error = error;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ApiClient client = ApiClient();
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
        actions: [
          SearchBarAnimation(
            isSearchBoxOnRightSide: true,
            textEditingController: TextEditingController(),
            isOriginalAnimation: true,
            searchBoxWidth: 280,
            durationInMilliSeconds: 400,
            onFieldSubmitted: (text) {
              client.getSongs(getSongList, getError, songName: text);
            },
          )
        ],
      ),
      body: Container(
        child: this.songs.length == 0 ? _showLoading() : _printSong(),
      ),
    );
  }

  ListView _printSong() {
    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Player(songs[index]))),
          leading: Image.network(songs[index].image),
          title: Text(songs[index].trackName),
          subtitle: Text(songs[index].artistName),
          trailing: IconButton(
              onPressed: () {
                ShakeDetector detector =
                    ShakeDetector.waitForStart(onPhoneShake: () {
                  index < songs.length ? index++ : index = 0;
                  _songControl(index++);
                });
                detector.startListening();
                _songControl(index);
              },
              icon: _playstatus(songs[index].trackName, index)),
        );
      },
      itemCount: songs.length,
    );
  }

  _songControl(
    int index,
  ) async {
    if (!songstatus || currentlyPlaying != songs[index].trackName) {
      currentlyPlaying = songs[index].trackName;

      songIndex = index;
      songstatus = true;
      int result = await audioPlayer.play(songs[index].audio);
      if (result == AppConstants.SUCCESS) {
        print('Song Played Successfully');
      }

      Flushbar(
        title: "Playing",
        message: currentlyPlaying + " by " + songs[index].artistName,
        duration: const Duration(seconds: 3),
      ).show(context);
    } else {
      songstatus = false;
      audioPlayer.pause();
      Flushbar(
        flushbarStyle: FlushbarStyle.FLOATING,
        title: "Paused",
        message: currentlyPlaying + " by " + songs[index].artistName,
        duration: Duration(seconds: 2),
      ).show(context);
    }
    setState(() {});
  }

  Center _showLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Icon _playstatus(String name, int index) {
    if (songstatus && songIndex == index && name == currentlyPlaying) {
      return Icon(Icons.pause, size: 20, color: Colors.red);
    } else {
      return Icon(Icons.play_arrow, size: 20, color: Colors.red);
    }
  }
}
