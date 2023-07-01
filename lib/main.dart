import 'package:coaching/Screens/home.dart';
import 'package:coaching/Screens/notification.dart';
import 'package:coaching/Services/pocketbase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pocketbase/pocketbase.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
   runApp(const MyApp());
  // PocketbaseApi pbi;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {},
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<Subject> sublist = [];
  final pb = PocketBase('https://pocketbase29.fly.dev');
  int index = 0;
  List screen = const [Homescreen(), notifiy()];

  @override
  void initState() {
    super.initState();
    PocketbaseApi().getData('10science');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 2),
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() {
          this.index = index;
        }),
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.notifications_active_outlined), label: '10th')
        ],
      ),
      backgroundColor: Color.fromARGB(255, 7, 41, 105),
      body: screen[index],
    );
  }
}
