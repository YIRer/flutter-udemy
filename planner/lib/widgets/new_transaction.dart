import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranaction extends StatefulWidget {
  final Function addTrx;

  NewTranaction(this.addTrx);

  @override
  _NewTranactionState createState() => _NewTranactionState();
}

class _NewTranactionState extends State<NewTranaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final String enteredTitle = _titleController.text;
    final double enterdAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enterdAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTrx(enteredTitle, enterdAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _percentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _percentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            FlatButton(
              onPressed: _submitData,
              child: Text('Add transactions'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
