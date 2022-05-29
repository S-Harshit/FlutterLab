import 'package:second_app/model/book_my_show_model.dart';

///Singelton
class ShowOperation {
  static final ShowOperation _showOperation = ShowOperation();

  _ShowOperation() {}

  static ShowOperation getInstance() {
    return _showOperation;
  }

  List<Show> getPost() {
    // we remove static because static is eager loading that is it loads in memoray as soon as app launches
    return [
      Show(
        name: "Inception",
        lang: "English",
        type: "2D",
        certificate: "U",
        likes: 100,
        votes: 10809,
        isNew: true,
        url:
            "https://collider.com/wp-content/uploads/inception_movie_poster_banner_01.jpg",
      ), Show(
        name: "Your Name",
        lang: "Japanese",
        type: "3D",
        certificate: "U",
        likes: 1000,
        votes: 11809,
        isNew: true,
        url:
            "https://4.bp.blogspot.com/-ecKyCJMQOR8/Wloddfk3tyI/AAAAAAAABi8/DxWG1mYxX2ga25lLElrQ0KmNwcU2MRRvgCLcBGAs/s1600/Kimi%2Bno%2BNa%2BWa_Banner.jpg",
      ),
      Show(
        name: "Hindi Medium",
        lang: "Hindi",
        type: "2D",
        certificate: "U",
        likes: 87,
        votes: 7809,
        isNew: false,
        url:
            "https://www.azdialogues.com/wp-content/uploads/2018/03/Hindi-Medium-dialogues.jpg",
      ),
      Show(
        name: "Finest Hour",
        lang: "English",
        type: "3D",
        certificate: "UA",
        likes: 99,
        votes: 9809,
        isNew: false,
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA1esdxCUcdbXv6uco5XGf74pTmDeBFcfyvA&usqp=CAU",
      ),
    ];
  }
}
