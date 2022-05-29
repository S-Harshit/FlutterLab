import 'package:http/http.dart' as http;
import 'dart:convert' as jsonconvert;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:songapp/config/constants/api_path.dart';
import 'package:songapp/models/song.dart';

class ApiClient {
  void getSongs(Function successCallBack, Function failCallBack,
      {String songName: 'Ed+Sheeran'}) async {
    String URL = ApisPath.BASE_URL + songName + "&limit=25.";
    Future<http.Response> future = http.get(Uri.parse(URL));
    future.then((response) {
      String json = response.body;
      Map<String, dynamic> map = jsonconvert.jsonDecode(json);
      List<dynamic> list = map['results'];

      List<Song> songs = list.map((songMap) => Song.fromJson(songMap)).toList();
      successCallBack(songs);

      print('map is $map and map type is ${map.runtimeType}');
      print("JSON $json");
      print(json.runtimeType);
    }).catchError((erro) => {failCallBack});
  }
}
