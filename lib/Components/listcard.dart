// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:math';
import 'package:coaching/Screens/_pdfviewer.dart';
import 'package:coaching/Services/pocketbase_api.dart';
import 'package:flutter/material.dart';
import '../modal/Recordmodel.dart';

// ignore: must_be_immutable
class ListCard extends StatefulWidget {
  ListCard({
    super.key,
    required this.data,
    required this.index,
  });

  Recordclass data;
  int index;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  var generatedColor = Random().nextInt(Colors.primaries.length);

  var fileurl = " ";

  // getUrl() async {
  //   var futureurl = await PocketbaseApi().getRecordFileURl(
  //       widget.data.collectionName, widget.data.id, widget.data.notes);
  //   if (futureurl.toString().isNotEmpty) {
  //     setState(() {
  //       fileurl = futureurl.toString();
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // getUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        // width: 50,
        // height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Pdfviewer(title: widget.data.title, url: fileurl),
          )),
          child: Hero(
            tag: widget.data.title,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                    padding: const EdgeInsets.all(8.0), child: _expTile()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ExpansionTile _expTile() {
    Map<String, dynamic> data = widget.data.toJson();
    List dtkeys = data.keys.skip(3).toList();
    List dtvalues = data.values.skip(3).toList();
    // bool loading = true;
    // getcl() {
    //   List dt = data.values.elementAt(3).toList();
    //   print(dt.runtimeType);
    // }
    Future<String> getUrl(values) async {
      var futureurl = await PocketbaseApi()
          .getRecordFileURl(widget.data.collectionName, widget.data.id, values);
      // print(futureurl);
      setState(() {
        fileurl = futureurl.toString();
      });
      return " ";
    }

    getfileurl() => fileurl;

    return ExpansionTile(
      title: Text(widget.data.title),
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[generatedColor],
        radius: 25,
        child: Text("Ch ${widget.index + 1}",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 350,
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
            itemCount: dtkeys.length - 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 10,
                width: 10,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(5.0),
                child: MaterialButton(
                  onPressed: () {
                    var data = dtvalues[index];
                    if (data.runtimeType == String) {
                      getUrl(dtvalues[index]);
                     
                      Timer(const Duration(seconds: 3), () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Pdfviewer(
                                title: widget.data.title, url: getfileurl()),
                          ));
                        });
                     
                    } else {
                     
                      print("Its a List");
                    }
                  },


                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  color: Colors.blueGrey.shade500,
                  clipBehavior: Clip.antiAlias,
                  elevation: 10,
                  child: Text(dtkeys[index]),
                ),
              );
            },
          ),
        )
        // ElevatedButton(onPressed: () => print(data.keys.skip(3)), child: const Text('Notes'))
      ],
    );
  }

  ListTile _listtile() {
    return ListTile(
        title: Text(widget.data.title),
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[generatedColor],
          radius: 25,
          child: Text("Ch ${widget.index + 1}",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        
        trailing: ElevatedButton(
          clipBehavior: Clip.antiAlias,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          onPressed: () => print(fileurl),
          child: const Text("Download"),
          // Icon(Icons.arrow_circle_down_sharp)
        ));
  }
}
