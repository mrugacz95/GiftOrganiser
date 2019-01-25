import 'package:firebase_database/firebase_database.dart';

class Note {
  String _id;
  String _text;

  Note(this._id, this._text);

  String get id => _id;

  String get text => _text;

  Note.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _text = snapshot.value['text'];
  }
}
