import 'dart:async';
import 'package:flutter/material.dart';

class StreatDome extends StatelessWidget {
  const StreatDome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
        elevation: 0.0,
      ),
      body: StreatDomeHome(),
    );
  }
}

class StreatDomeHome extends StatefulWidget {
  @override
  _StreatDomeHomeState createState() => _StreatDomeHomeState();
}

class _StreatDomeHomeState extends State<StreatDomeHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  // StreamSink _sinkDome;
  String _data = "...";
  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print("创建Stream");
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController<String>();
    // _streamDemo.stream.asBroadcastStream();
    // _sinkDome = _streamDemo.sink;
    // var stream = _streamDemo.stream.asBroadcastStream();
    // var sink = _streamDemo.sink;
      print("监听Stream");

    // _streamSubscription =
    //     _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    print("Stream初始化完成");
  }

  void onData(String data) {
    print("$data");
    setState(() {
      _data = data;
    });
  }

  void onError(error) {
    print("错误: $error");
  }

  void onDone() {
    print("完成!");
  }

  void _addStream() async {
    print("添加订阅");
    String data = await fetchData();
    _streamDemo.add(data);
    // _sinkDome.add(data);
  }

  void _pauseStream() {
    print("停止订阅");
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print("恢复订阅");
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print("取消订阅");
    _streamSubscription.cancel();
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw "我是一个异常";
    return "你好 ~";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("添加"),
                  onPressed: _addStream,
                ),
                FlatButton(
                  child: Text("暂停"),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text("恢复"),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text("取消"),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
