import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class Setting extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Setting> {
  bool _noti = false;
  bool _lang = false;

  List<Widget> list = [];

  _State() {
    list.add(SwitchListTile(
      title: const Text('ตั้งค่าภาษา'),
      value: _lang,
      onChanged: (bool value) {
        setState(() {
          _lang = value;
        });
      },
      secondary: const Icon(Icons.language),
    ));
    list.add(SwitchListTile(
      title: const Text('ตั้งค่าการแจ้งเตือน'),
      value: _noti,
      onChanged: (bool value) {
        setState(() {
          _noti = value;
        });
      },
      secondary: const Icon(Icons.notifications_active),
    ));
    list.add(ListTile(
      leading: Icon(Icons.person),
      title: Text('แก้ไขข้อมูลส่วนตัว'),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.pushNamed(context, "/profile");
      },
    ));
    list.add(ListTile(
      leading: Icon(Icons.help),
      title: Text('ช่วยเหลือ'),
      trailing: const Icon(Icons.arrow_forward),
    ));
    list.add(ListTile(
      leading: Icon(Icons.info),
      title: Text('เกี่ยวกับเรา'),
      trailing: const Icon(Icons.arrow_forward),
    ));

    Future<PackageInfo> future = PackageInfo.fromPlatform();
    print(future);
    future.then((package) {
      setState(() {
        list.add(ListTile(
          title: Text("Version: " + package.version),
          subtitle: Text("Build: " + package.buildNumber),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ตั้งค่า"),
      ),
      body: new ListView(
        children: list,
      ),
    );
  }
}
