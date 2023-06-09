import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class myLiverpool extends StatefulWidget {
  static const routeName = '/liverpool';
  const myLiverpool({super.key});

  @override
  State<myLiverpool> createState() => _myLiverpoolState();
}

class _myLiverpoolState extends State<myLiverpool> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pertandingan Liverpool'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _firestore.collection('matches').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      children: snapshot.data!.docs.map((document) {
                        final data = document.data();
                        return ListTile(
                          leading: Image.network(data['logo1']),
                          trailing: Image.network(data['logo2']),
                          title: Text(data['team1']),
                          subtitle: Text(data['team2']),
                        );
                      }).toList(),
                    );
                  }))
        ],
      ),
    );
  }
}
