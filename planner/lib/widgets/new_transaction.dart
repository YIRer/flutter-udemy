import 'package:flutter/material.dart';

class NewTranaction extends StatefulWidget {
  final Function addTrx;

  NewTranaction(this.addTrx);

  @override
  _NewTranactionState createState() => _NewTranactionState();
}

class _NewTranactionState extends State<NewTranaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final String enteredTitle = titleController.text;
    final double enterdAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enterdAmount <= 0) {
      return;
    }

    widget.addTrx(enteredTitle, enterdAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add transactions'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
