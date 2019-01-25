import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_organiser/model/note.dart';
import 'package:gift_organiser/screens/tabs/add_wishlist.dart';

final notesReference = FirebaseDatabase.instance.reference().child('notes');

class WishList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WishListState();
  }
}

class _WishListState extends State<WishList> {
  List<Note> _list;

  StreamSubscription<Event> _onNoteAddedSubscription;
  StreamSubscription<Event> _onNoteChangedSubscription;

  @override
  void initState() {
    super.initState();
    _list = [];

    _onNoteAddedSubscription = notesReference.onChildAdded.listen(_onNoteAdded);
    _onNoteChangedSubscription =
        notesReference.onChildChanged.listen(_onNoteUpdated);
  }

  @override
  void dispose() {
    _onNoteAddedSubscription.cancel();
    _onNoteChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: goToAddWishList,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(_list[_list.length - 1 - position].text),
            subtitle: Text(_list[_list.length - 1 - position].id),
          );
        },
      ),
    );
  }

  void _onNoteAdded(Event event) {
    setState(() {
      _list.add(new Note.fromSnapshot(event.snapshot));
    });
  }

  void _onNoteUpdated(Event event) {
    var oldNoteValue =
        _list.singleWhere((note) => note.id == event.snapshot.key);
    setState(() {
      _list[_list.indexOf(oldNoteValue)] =
          new Note.fromSnapshot(event.snapshot);
    });
  }

  void goToAddWishList() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddWishList()));
  }
}
