import 'package:drink_calculator/src/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkFormDialog extends StatefulWidget {
  final String title;
  final String actionTitle;
  final Function addDrink;
  final Drink? drink;

  const DrinkFormDialog(this.title, this.actionTitle, this.addDrink, {this.drink, super.key});

  @override
  DrinkFormDialogState createState() => DrinkFormDialogState();
}

class DrinkFormDialogState extends State<DrinkFormDialog> {
  final _nameController = TextEditingController();
  final _alcoholContentController = TextEditingController();
  final _volumeController = TextEditingController();
  final _priceController = TextEditingController();

  String _volumeUnit = 'l';
  String _priceUnit = 'zł';

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

    widget.addDrink(enteredName, enteredAlcoholContent, enteredVolume, _volumeUnit, enteredPrice, _priceUnit);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.drink != null) {
      _volumeUnit = widget.drink!.volumeUnit;
      _priceUnit = widget.drink!.priceUnit;
      _nameController.text = widget.drink!.name;
      _alcoholContentController.text = widget.drink!.alcoholContent.toString();
      _volumeController.text = widget.drink!.volume.toString();
      _priceController.text = widget.drink!.price.toString();
    }
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                DropdownButton<String>(
                  value: _volumeUnit,
                  items: <String>['l', 'ml'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _volumeUnit = value!;
                    });
                  },
                ),
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
          child: Text(widget.actionTitle),
        ),
      ],
    );
  }
}