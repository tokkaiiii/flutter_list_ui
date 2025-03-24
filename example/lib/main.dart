import 'package:flutter/material.dart';
import 'package:flutter_list_ui/src/widgets/Info.dart';
import 'package:flutter_list_ui/src/widgets/InfoCard.dart';
import 'package:flutter_list_ui/src/widgets/InfoHeader.dart';
import 'package:flutter_list_ui/src/widgets/InfoList.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyInfo(),
      ),
    ),
  );
}

class MyInfo extends Info {
  MyInfo({super.key}) : super(
    card: MyInfoCard(),
  );
}

class MyInfoCard extends InfoCard {
  MyInfoCard({super.key}) : super(
    header: MyInfoHeader(),
    body: MyInfoList(),
  );
}

class MyInfoHeader extends InfoHeader {
  MyInfoHeader({super.key}) : super(
    title: 'My App',
  );
}

class MyInfoList extends InfoList {
  MyInfoList({super.key}) : super(
    items: [
      // 예시 데이터
      {'title': '제목 1', 'subtitle': '부제목 1'},
      {'title': '제목 2', 'subtitle': '부제목 2'},
    ],
    backgroundColor: Colors.white,
  );

  @override
  Widget buildItem(dynamic item) {
    return ListTile(
      title: Text(item['title']),
      subtitle: Text(item['subtitle']),
    );
  }
}
