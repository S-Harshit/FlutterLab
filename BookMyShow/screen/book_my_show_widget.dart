import 'package:flutter/material.dart';
import 'package:second_app/model/book_my_show_model.dart';
import 'package:second_app/repo/show_operation.dart';
import 'package:second_app/widget/textbox_widget.dart';

class BookMyShowWidget extends StatelessWidget {
  List<Show> post = [];

  BookMyShowWidget({Key? key}) : super(key: key) {
    ShowOperation sp = ShowOperation.getInstance();
    post = sp.getPost();
  }

  List<Widget> _prepareShowPost() {
    List<Widget> list = post.map((show) {
      bool isNew = show.isNew;
      return Stack(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                Stack(
                  children: [
                    Card(
                      child: Image.network(
                          show.url.toString(),
                          fit: BoxFit.fill),
                    ),
                    Positioned(
                      top: 3.8,
                      left: 4,
                      child: Visibility(
                        visible: isNew,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'New',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 22,
                      left: 14,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.green,
                          child: Text(
                            show.certificate,
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 18,
                      bottom: 18,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  const WidgetSpan(
                                    child: const Icon(
                                      Icons.heart_broken_rounded,
                                      color: Colors.red,
                                    ),
                                  ),
                                  TextSpan(
                                      text: ' ' + show.likes.toString() + "%",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ]),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                show.votes.toString() + ' votes',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            show.name.toString(),
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Text(
                                show.lang,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 8,),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                margin: const EdgeInsets.only(left: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    show.type.toString(),
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('BOOK'),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFFE2E55))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }).toList();

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "All Language",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Container(
                            color: Colors.grey,
                            width: 1,
                            height: 24,
                          ),
                          const Text(
                            "Cinema",
                            style: TextStyle(fontSize: 18),
                          ),
                        ]),
                  ),
                ),
                Column(
                  children: _prepareShowPost(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
