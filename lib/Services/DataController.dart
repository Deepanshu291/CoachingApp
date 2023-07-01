
import 'package:coaching/Services/pocketbase_api.dart';
import 'package:coaching/modal/Recordmodel.dart';
import 'package:coaching/modal/notificationmodal.dart';

class DataController {
  // Future<List<Recordclass>> getclass(table) async {
  //   var res = PocketbaseApi().getData(table);
  //   List<dynamic> mylist = res;

  // }

  Future<List<Recordclass>> getdata(String table) async {
    List data = await PocketbaseApi().getData(table);
    print(data.runtimeType);
    List<Recordclass> mylist =
        data.map((e) => Recordclass.fromRecord(e)).toList();
    return mylist;
  }

  Future<List<Blognews>> getnews() async {
    List data = await PocketbaseApi().getData('blognews');
    // print(data);
    List<Blognews> mydata = data.map((e) => Blognews.fromRecord(e)).toList();
    return mydata;
  }
}
