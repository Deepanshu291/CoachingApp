// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coaching/Screens/Blog.dart';
import 'package:coaching/Services/DataController.dart';
import 'package:coaching/modal/notificationmodal.dart';
import 'package:flutter/material.dart';

class notifiy extends StatefulWidget {
  const notifiy({super.key});

  @override
  State<notifiy> createState() => _notifiyState();
}

class _notifiyState extends State<notifiy> {
  List<Blognews> data = [];
  bool isloading = true;
  var refreshkey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 2));
    getresource();
  }

  getresource() {
    DataController().getnews().then((value) {
      if (value.isNotEmpty) {
        setState(() {
          data = value;
          isloading = false;
        });
      } else {
        isloading = true;
        getresource();
      }
    });

    print(data.length);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refresh(),
      child: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.deepPurpleAccent,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlogPage(),
                              )),
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.black26,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                // height: 200,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                        height: 250,
                                        width: 150,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            Center(
                                              child: CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        imageUrl: 
                                            "https://images.unsplash.com/photo-1687579520792-eae9e274a3ca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"),
                                    Container(
                                      // width: 150,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      // alignment: Alignment.topRight,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(data[index].category,
                                              style: TextStyle(
                                                  color: Colors.purple.shade700,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 5)),
                                          SizedBox(height: 2),
                                          Container(
                                              width: 200,
                                              child: Text(
                                                  data[index].name,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      overflow:
                                                          TextOverflow.fade))),
                                          Container(
                                            width: 180,
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 200,
                                            child: Text(
                                              data[index].metadata,
                                              // widget.news.description,
                                              maxLines: 7,
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // IconButton(onPressed: null, icon: Icon(Icons.arrow_forward))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                        // return notifytile(
                        //   index: index,
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// ignore: camel_case_types
class notifytile extends StatelessWidget {
  notifytile({super.key, required this.index});

  int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("This is Notification"),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // leading: CachedNetworkImage(imageUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fdepositphotos.com%2Fvector-images%2Fnews.html&psig=AOvVaw3b0lyhl6rHoqVqL2xEvtQC&ust=1687705067472000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCPCZkriV3P8CFQAAAAAdAAAAABAS"),
      leading: CircleAvatar(
        backgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        radius: 25,
        child: Text("${index + 1}"),
      ),
      textColor: Colors.white,
      trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
      subtitle: Text("This is suvtile"),
    );
  }
}
