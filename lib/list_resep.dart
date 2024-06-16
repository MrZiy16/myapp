import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

class ListResep extends StatefulWidget {
  @override
  ListResepState createState() => ListResepState();
}

class ListResepState extends State<ListResep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Resep'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('kuliner').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(documentSnapshot['nama']),
                    subtitle: Text(documentSnapshot['deskripsi']),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Tampilkan detail resep
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(documentSnapshot['nama']),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Deskripsi: ${documentSnapshot['deskripsi']}'),
                                SizedBox(height: 8),
                                Text('Resep: ${documentSnapshot['resep']}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Tutup'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}