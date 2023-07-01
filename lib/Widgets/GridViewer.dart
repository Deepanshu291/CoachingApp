import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'Listviewer.dart';
import '../modal/classesmodal.dart';

class GridViewer extends StatelessWidget {
  const GridViewer({super.key, required this.data});
  final List<Classes> data;
  // final List<MenuItem> menu;
  // final List<Classes> _classes = getclassesdata();
 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: Colors.white),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          //  final List<Classes> clssdata = data;
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ListViewer(
                table:  data[index],
              ),
            )),
            child: Card(
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                  child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "https://static.vecteezy.com/system/resources/previews/004/852/860/non_2x/notes-notepad-notebook-memo-diary-paper-line-icon-illustration-logo-template-suitable-for-many-purposes-free-vector.jpg")),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data[index].title)
                  ],
                ),
              )),
            ),
          );
        },
      ),
      // child: const ListViewer(),
    );
  }
}
