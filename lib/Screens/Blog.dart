import 'package:flutter/material.dart';

void main() => runApp(const BlogPage());

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                child: Icon(Icons.facebook , size: 100, color: Colors.blue),
              )
              
            ],
          ),
        )
    );
  }
}