import 'package:coaching/modal/Recordmodel.dart';

class Classes {
  String title, tablename;
  Classes({required this.title, required this.tablename});
}

List<Classes> _classes = [
  Classes(title: '10th Science', tablename: '10science'),
  Classes(title: '9th Science', tablename: '9science')
];

List<Classes> getclassesdata() {
  return _classes;
}



class MenuItem {
  String name;
  String img;
  List<Recordclass> data;

  MenuItem({required this.name, required this.data, required this.img});
}

getmenuitem(List<Recordclass> data){
  // List<MenuItem> _menu = [MenuItem(name: 'Notes', )];

}


// List<MenuItem> _menu = [MenuItem(name: 'Notes', data: )];
