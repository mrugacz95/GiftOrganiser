import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_organiser/model/Present.dart';

class AddWishList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddWishListState();
  }
}

final notesReference = FirebaseDatabase.instance.reference().child('notes');

class _AddWishListState extends State<AddWishList> {
  List<Present> _list = [];
  final _newITemController = TextEditingController();
  final _nameITemController = TextEditingController();
  final _descriptionITemController = TextEditingController();

  @override
  void initState({id: String}) {
    _nameITemController.text = 'New wish list';
    _descriptionITemController.text = 'Short or long description';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new wish list'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: sendWishListAndPop,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: "New wishlist",
                ),
                controller: _nameITemController),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: "Whish list for presents",
              ),
              controller: _descriptionITemController,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: "New Item name"),
                    controller: _newITemController,
                  ),
                ),
                MaterialButton(
                  minWidth: 20,
                  child: Text("Add"),
                  onPressed: addNewItem,
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                        title: Text((position + 1).toString() +
                            '. ' +
                            _list[position].text));
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _newITemController.dispose();
    super.dispose();
  }

  void addNewItem() {
    setState(() {
      _list.add(Present('-1', _newITemController.text));
      _newITemController.clear();
    });
  }

  void sendWishListAndPop() {
    notesReference.push().set({'text': _nameITemController.text});
    Navigator.pop(context);
  }
}
