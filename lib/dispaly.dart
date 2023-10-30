import 'package:flutter/material.dart';
import 'package:flutter_page_view_image_guru/appdata.dart';

class DisplayImage extends StatelessWidget {
  final AppDataImage appdata;
  const DisplayImage({super.key, required this.appdata});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(appdata.image),
        ),
      ),
    );
  }
}

// AssetImage(appdata.image)
