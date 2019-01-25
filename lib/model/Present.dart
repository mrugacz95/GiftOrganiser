import 'package:firebase_database/firebase_database.dart';

class Present {
  String _id;
  String _text;

  Present(this._id, this._text);

  String get id => _id;

  String get text => _text;

  Present.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _text = snapshot.value['text'];
  }
}
