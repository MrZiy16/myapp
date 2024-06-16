import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getDownloadURL(String imageName) async {
  String downloadURL = await FirebaseStorage.instance
      .ref('uploads/$imageName')
      .getDownloadURL();
  return downloadURL;
}

class DisplayImage extends StatelessWidget {
  final String imageName;

  DisplayImage({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDownloadURL(imageName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Image.network(snapshot.data.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return Container();
      },
    );
  }
}
