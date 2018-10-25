import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'bilibilidownload',
      theme: new ThemeData(
        primaryColor: Colors.pinkAccent,
        primarySwatch: Colors.pink,
      ),
      home: new MyHomePage(title: '哔哩直链提取'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          _buildLinkInput(),
          _buildQualitySelect(),
          _buildTypeSelect(),
          _buildParseBt()
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: new Icon(Icons.file_download),
      ),
    );
  }


  //链接输入框
  Widget _buildLinkInput() {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: new TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        icon: Icon(Icons.share),
        labelText: "输入链接",
        helperText: "哔哩哔哩客户端->分享->复制链接"
        ),
        obscureText: true,
      ),
    );
  }

  //视频清晰度选择
  Widget _buildQualitySelect() {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: new Row(
        children: <Widget>[
          new Text("清晰度: "),
          new Radio(value: 1, groupValue: null, onChanged: null,activeColor: Colors.pinkAccent,),
          new Radio(value: 2, groupValue: null, onChanged: null,activeColor: Colors.pinkAccent,),
          new Radio(value: 3, groupValue: null, onChanged: null,activeColor: Colors.pinkAccent,),
          new Radio(value: 4, groupValue: null, onChanged: null,activeColor: Colors.pinkAccent,),
        ],
      ),
    );
  }

  // 视频下载客户端类型
  Widget _buildTypeSelect() {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: new Row(
        children: <Widget>[
          new Text("客户端: "),
          new Radio(value: 1, groupValue: null, onChanged: null,activeColor: Colors.pinkAccent,),
          new Radio(value: 2, groupValue: null, onChanged: null,activeColor: Colors.pinkAccent,),
          new Radio(value: 3, groupValue: null, onChanged: null,activeColor: Colors.pinkAccent,),
        ],
      ),
    );
  }

  //解析按钮
  Widget _buildParseBt() {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(
              onPressed: (){},
              color: Colors.pinkAccent,
              child: new Text(
                "开始解析", style: new TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
