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

  List _quality = ["1080P", "720P", "480P"];
  List _client = ["正式版", "Play版", "概念版"];

  List<DropdownMenuItem<String>> _qualityItems;
  List<DropdownMenuItem<String>> _clientItems;

  String _selectedQuality;
  String _selectedClient;

  @override
  void initState() {
    _qualityItems = buildAndGetDropDownMenuItem(_quality);
    _selectedQuality = _qualityItems[0].value;
    _clientItems = buildAndGetDropDownMenuItem(_client);
    _selectedClient = _clientItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItem(List items) {
    List<DropdownMenuItem<String>> tmp = new List();
    for (String item in items) {
      tmp.add(new DropdownMenuItem(value: item, child: new Text(item)));
    }
    return tmp;
  }

  void changeQuality(String selectedQuality) {
    setState(() {
      _selectedQuality = selectedQuality;
    });
  }

  void changeClient(String selectedClient) {
    setState(() {
      _selectedClient= selectedClient;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          _buildLinkInput(),
          _buildConfigSelect(),
          _buildParseBt()
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: '生成直链文本',
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

  //视频清晰度和客户端选择
  Widget _buildConfigSelect() {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text("清晰度: "),
                new DropdownButton(
                  value: _selectedQuality,
                  items: _qualityItems,
                  onChanged: changeQuality,
                ),
              ],
            ),
          ),
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text("客户端: "),
                new DropdownButton(
                  value: _selectedClient,
                  items: _clientItems,
                  onChanged: changeClient,
                ),
              ],
            ),
          ),
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
