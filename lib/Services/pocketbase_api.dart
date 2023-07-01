import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pocketbase/pocketbase.dart';


 var BaseUrl = dotenv.get('BASEURL');
final pb = PocketBase(BaseUrl);

class PocketbaseApi {
 Future getAll() async{
  
 }

  Future getData(String table) async {
    final res = await pb.collection(table).getFullList();
    // final rec = await pb.collection(table).getOne('');
    // rec.getListValue<String>('documents')[0];
    // print(res.runtimeType);
    // List<RecordModel> mylist = res;
    // List<dynamic> mylist = res;
    // print(res);
    return res;
  }

  Future<String> getRecordFileURl(
      String table, String id, String filename) async {
    final record = await pb.collection(table).getOne(id);
    // final firstFilename = record.getListValue<String>('documents')[index];
    // print(record);
    final url = pb.getFileUrl(record, filename);
    // print(url.toString());
    return url.toString();
  }
}
// fetch a paginated records list
// final resultList = await pb.collection('10science').getList(
//   page: 1,
//   perPage: 50,
//   filter: 'created >= "2022-01-01 00:00:00" && someFiled1 != someField2',
// );

// // you can also fetch all records at once via getFullList
// final records = await pb.collection('10science').getFullList(
//   batch: 200,
//   sort: '-created',
// );

// // or fetch only the first record that matches the specified filter
// final record = await pb.collection('10science').getFirstListItem(
//   'someField="test"',
//   expand: 'relField1,relField2.subRelField',
// );