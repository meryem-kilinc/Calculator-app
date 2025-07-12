import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Hesap makinesi", home: Iskele());
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basit Hesap Makinesi")),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  num? sayi1, sayi2, sonuc =0;

  TextEditingController  t1 =   TextEditingController();
  TextEditingController  t2 =   TextEditingController();

  void sayiTopla() {
    if (sayiGecerliMi()) {
      setState(() {
        sonuc = sayi1! + sayi2!;
      });
    }
  }

  void sayiCikar() {
    if (sayiGecerliMi()) {
      setState(() {
        sonuc = sayi1! - sayi2!;
      });
    }
  }

  void sayiCarp() {
    if (sayiGecerliMi()) {
      setState(() {
        sonuc = sayi1! * sayi2!;
      });
    }
  }

  void sayiBol() {
    if (sayiGecerliMi()) {
      setState(() {
        if (sayi2 != 0) {
          sonuc = sayi1! / sayi2!;
        } else {
          sonuc = double.nan; // Sıfıra bölme
        }
      });
    }
  }

bool sayiGecerliMi() {
    try {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      return true;
    } catch (e) {
      setState(() {
        sonuc = null;
      });
      return false;
    }
  }

@override
Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              sonuc == null ? "Sonuç: -" : "Sonuç: $sonuc",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
             TextField(
              controller: t1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "1. Sayı"),
            ),
            TextField(
              controller: t2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "2. Sayı"),
            ),
            ElevatedButton(onPressed: sayiTopla,child: Text("Topla"),),
            ElevatedButton(onPressed: sayiCikar,child: Text("Çıkar"),),
            ElevatedButton(onPressed: sayiCarp,child: Text("Çarp"),),
            ElevatedButton(onPressed: sayiBol,child: Text("Böl"),
            ),
             ]
          ),
          ),
    );
  }
}