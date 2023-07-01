import 'package:coaching/modal/classesmodal.dart';
import 'package:flutter/material.dart';

import '../Components/listcard.dart';
import '../Services/DataController.dart';

// ignore: must_be_immutable
class ListViewer extends StatefulWidget {
  ListViewer({super.key, required this.table});

  Classes table;

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  @override
  void initState() {
    super.initState();
    print(widget.table);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.table.title),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: DataController().getdata(widget.table.tablename),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // List<Recordclass> data = snapshot.data;

                // print();
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    // Subject _data = data[index];
                    // return Text(data[index].title);
                    return ListCard(
                      data: snapshot.data[index],
                      index: index,
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ))
        ],
      ),
    );
  }
}
