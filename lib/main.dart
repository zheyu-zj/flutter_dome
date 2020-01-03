import 'package:flutter/material.dart';
import 'model/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(), theme: ThemeData(primaryColor: Colors.pink));
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('你好',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 40.0, color: Colors.pink, fontWeight: FontWeight.bold)),
    );
  }
}

class Home extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(height: 16),
          Text(posts[index].title, style: Theme.of(context).textTheme.title),
          Text(posts[index].author, style: Theme.of(context).textTheme.subhead),
          SizedBox(height: 16)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("赵杰"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
