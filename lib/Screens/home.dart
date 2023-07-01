
import 'package:coaching/Widgets/GridViewer.dart';
import 'package:coaching/modal/classesmodal.dart';
import 'package:flutter/material.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    // PocketbaseApi().getData('10science');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Header(
      size: size,
    );
  }
}

// ignore: must_be_immutable
class Header extends StatelessWidget {
  Header({super.key, required this.size});

  Size size;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.blueAccent.shade700,
                expandedHeight: size.height *0.80 ,
                floating: true,
                // foregroundColor: Colors.grey.shade400,
                pinned: true,
                // elevation: 5,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10))),
                actions: const [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.amber,
                      )),
                ],

                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    "BS Coaching Center",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  background: Container(
                    // height: size.height,
                    padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                    decoration: BoxDecoration(
                        // image: const DecorationImage(
                        //     image: CachedNetworkImageProvider(
                        //         "https://render.fineartamerica.com/images/rendered/default/greeting-card/images-medium-5/abstract-texture-background-miodrag-kitanovic.jpg?&targetx=-24&targety=0&imagewidth=749&imageheight=500&modelwidth=700&modelheight=500&backgroundcolor=325657&orientation=0"),
                        //     fit: BoxFit.fill),
                        color: Colors.blueAccent.shade700,
                        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.purpleAccent.shade400,
                              Colors.blueAccent.shade700
                            ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                              radius: 50.0,
                            ),
                            SizedBox(width: 20.0),
                            Text(
                              "Hello, Username",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // _cardgrid()
                        // TextField()
                      ],
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
            ],
        body: GridViewer(data: getclassesdata())
        
        );
  }
}

// ignore: camel_case_types

