import 'package:flutter/material.dart';

class StateTeksUtama extends State<TeksUtama> {
  var listNama = [
    'Afif Galih',
    'Cristiano Ronaldo',
    'Tom Cruise',
    'Fabiano Caruana',
    'Masashi Kishimoto',
    'Valentino Rossi',
    'Spongebob',
    'Ed Sheeran'
  ];
  var listWarna = [
    Color.fromARGB(255, 71, 255, 77),
    Color.fromARGB(255, 0, 161, 254),
    Color.fromARGB(255, 255, 77, 0),
    Color.fromARGB(255, 157, 25, 16),
    Color.fromARGB(255, 255, 2, 23),
    Color.fromARGB(255, 253, 110, 0),
    Color.fromARGB(255, 255, 3, 137),
    Color.fromARGB(255, 1, 180, 94),
    Color.fromARGB(255, 253, 6, 220)
  ];
  int index = 0;

  void incrementIndex() {
    setState(() {
      index++;
    });
  }

  double calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    String currentName = listNama[index % listNama.length];
    TextStyle textStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: listWarna[index % listWarna.length],
    );

    double textWidth = calculateTextWidth(currentName, textStyle);
    double size = textWidth + 20; // Adding padding/margin

    return Container(
      height: size, // Make the container a square based on text width
      width: size, // Make the container a square based on text width
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 196, 252, 217),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(25, 50), // Shadow position
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Rare People',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            textDirection: TextDirection.ltr,
          ),
          Text(
            currentName,
            textDirection: TextDirection.ltr,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class TeksUtama extends StatefulWidget {
  final state = StateTeksUtama();

  @override
  State<StatefulWidget> createState() => state;
}

void main() {
  TeksUtama teksUtama = TeksUtama();

  runApp(MaterialApp(
    title: 'Real King',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Flutter App Shadow'),
      ),
      body: Center(
        child: teksUtama,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Random',
        child: Icon(Icons.refresh),
        onPressed: teksUtama.state.incrementIndex,
      ),
    ),
  ));
}
