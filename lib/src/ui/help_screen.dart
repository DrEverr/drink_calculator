import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pomoc',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Aplikacja służy do obliczania ceny za 1 litr napoju alkoholowego.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Wprowadź nazwę napoju, zawartość alkoholu, objętość,',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'cenę oraz jednostki objętości i ceny*.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Następnie naciśnij przycisk "Oblicz".',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Co oznacza indeks alkoholowy?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Wydając taką samą kwotę na napój o wyższym indeksie alkoholowym',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'otrzymasz więcej alkoholu w porównaniu do napoju o niższym indeksie alkoholowym.',
              style: TextStyle(
                fontSize: 16),
            ),
            SizedBox(height: 100),
            Text(
              '* Domyślnie jednostki to: l i zł. Możesz nie mieć możliwości ich zmiany w aktualnej wersji aplikacji.',
              style: TextStyle(
                fontSize: 9,
              ),
            ),
          ],
        )
      ),
    );
  }
}