import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:firebase_database/firebase_database.dart';

class InputPage extends StatelessWidget {
  InputPage({Key? key}) : super(key: key);

  final wordInputController = TextEditingController();

  Future<void> submitWord(BuildContext context) async {
    if (wordInputController.text.isEmpty) {
      return;
    }
    final ref = FirebaseDatabase.instance.ref('words');
    final snapshot = await ref.get();
    if (snapshot.exists) {
      ref.update({
        wordInputController.text.toLowerCase(): (((snapshot.value!
                    as Map)[wordInputController.text.toLowerCase()] ??
                0) as int) +
            1
      });
    } else {
      ref.set({wordInputController.text.toLowerCase(): 1});
    }
    wordInputController.clear();
    Navigator.of(context).pushNamed('/view');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: CupertinoTextField(
                  controller: wordInputController,
                )),
            SizedBox(
              height: 8,
            ),
            CupertinoButton.filled(
                child: Text('Submit'),
                onPressed: () {
                  submitWord(context);
                })
          ],
        ),
      ),
    ));
  }
}
