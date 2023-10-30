import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_page_view_image_guru/appdata.dart';
import 'package:flutter_page_view_image_guru/dispaly.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class PageViewImageScreen extends StatefulWidget {
  const PageViewImageScreen({super.key});

  @override
  State<PageViewImageScreen> createState() => _PageViewImageScreenState();
}

class _PageViewImageScreenState extends State<PageViewImageScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Warren Buffet Quorts',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) =>
                [PopupMenuItem(value: 1, child: Text('Share'))],
            onSelected: (value) {
              if (value == 1) {
                _shareInfo();
              }
            },
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            height: 400,
            width: 400,
            child: PageView.builder(
                itemCount: appdata.length,
                itemBuilder: (context, index) {
                  return DisplayImage(appdata: appdata[index]);
                }),
          )
        ],
      )),
    );
  }

  _shareInfo() async {
    ByteData imagebyte = await rootBundle.load(appdata[selectedIndex].image);
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/downlode.jpg';
    File(path).writeAsBytesSync(imagebyte.buffer.asUint8List());
    await Share.shareFiles([path], text: 'image Shared');
  }
}
