import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatPage extends StatefulWidget {
  @override
  _FirebaseChatPageState createState() => new _FirebaseChatPageState();
}
 
class _FirebaseChatPageState extends State<FirebaseChatPage> {
  final _mainReference = FirebaseDatabase.instance.reference().child("messages");
  final _textEditController = TextEditingController();
 
  List<ChatEntry> entries = new List();  // チャッtのメッセージリスト
 
  @override
  initState() {
    super.initState();
    _mainReference.onChildAdded.listen(_onEntryAdded);
  }
 
  _onEntryAdded(Event e) {
    setState(() {
      entries.add(new ChatEntry.fromSnapShot(e.snapshot));
    });
  }
 
  // 画面全体のビルド
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Firebase Chat")
      ),
      body: Container(
        child: new Column(
          children: <Widget>[
            Expanded(
              child: 
              ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context, int index) {
                  return _buildRow(index);
                },
                itemCount: entries.length,
              ),
            ),
            Divider(height: 4.0,),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildInputArea()
            )
          ],
        )
      ),
    );
  }
   
  // 投稿されたメッセージの1行を表示するWidgetを生成
  Widget _buildRow(int index) {
    return Card(
      child: ListTile(
        title: Text(entries[index].message)
      )
    );
  }
   
  // 投稿メッセージの入力部分のWidgetを生成
  Widget _buildInputArea() {
    return Row(
      children: <Widget>[
        SizedBox(width: 16.0,),
        Expanded(
          child: TextField(
            controller: _textEditController,
          ),
        ),
        CupertinoButton(
          child: Text("Send"),
          onPressed: () {
            _mainReference.push().set(ChatEntry(DateTime.now(), _textEditController.text).toJson());
            _textEditController.clear();
            // キーボードを閉じる
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        )
      ],
    );
  }
}