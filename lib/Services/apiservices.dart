import 'package:coaching/modal/subject.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<Subject>> getdata(table) async {
  var BaseUrl = dotenv.get('BASEURL');
  var res = await Dio().get( BaseUrl + "/api/collections/" + table + "/records");
  // print(res.data['items'][0].runtimeType);
  var re = res.data['items'];

  if (res.statusCode == 200) {
    // print(re.runtimeType);
    List<dynamic> mylist = re;
    List<Subject> sublist = mylist.map((e) => Subject.fromJson(e)).toList();
    // print(sublist);
    return sublist;
    // print(mylist);
  } else {
    return [];
  }
}
