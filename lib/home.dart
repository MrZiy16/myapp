import 'package:flutter/material.dart';
import 'package:myapp/list_resep.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kulinerin'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.book), text: "Resep"),
              Tab(icon: Icon(Icons.video_library), text: "Video Tutorial"),
              Tab(icon: Icon(Icons.qr_code), text: "Scan"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListResep(),
            Text('kepo'),
            Text('kepo'),
         
          ],
        ),
      ),
    );
  }
}