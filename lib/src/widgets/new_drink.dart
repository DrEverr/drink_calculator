import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewDrinkDialog extends StatefulWidget {
  final Function addDrink;

  const NewDrinkDialog(this.addDrink, {super.key});

  @override
  NewDrinkDialogState createState() => NewDrinkDialogState();
}

class NewDrinkDialogState extends State<NewDrinkDialog> {
  final _nameController = TextEditingController();
  final _alcoholContentController = TextEditingController();
  final _volumeController = TextEditingController();
  final _priceController = TextEditingController();

  void _submitData() {
    final enteredName = _nameController.text;
    final enteredAlcoholContent = double.tryParse(_alcoholContentController.text);
    final enteredVolume = double.tryParse(_volumeController.text);
    final enteredPrice = double.tryParse(_priceController.text);

    if (enteredName.isEmpty || 
    enteredAlcoholContent == null || enteredAlcoholContent <= 0 || 
    enteredVolume == null || enteredVolume <= 0 || 
    enteredPrice == null || enteredPrice <= 0) {
      return;
    }

    widget.addDrink(enteredName, enteredAlcoholContent, enteredVolume, enteredPrice);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Dodaj nowy napój'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  width: 225.0,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Nazwa'),
                    controller: _nameController,
                    onSubmitted: (_) => _submitData(),
                  ),
                ),
                const Text(''),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 225.0,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Zawartość alkoholu'),
                    controller: _alcoholContentController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                ),
                const Text('%'),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 225.0,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Objętość'),
                    controller: _volumeController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                ),
                const Text('L'),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 225.0,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Cena'),
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                ),
                const Text('zł'),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Anuluj'),
        ),
        TextButton(
          onPressed: _submitData,
          child: const Text('Dodaj'),
        ),
      ],
    );
  }
}