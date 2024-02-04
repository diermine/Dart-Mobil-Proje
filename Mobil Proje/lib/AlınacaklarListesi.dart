import 'package:flutter/material.dart';

class AlinacakNesne {
  String ihtiyacAdi;
  int adet;

  AlinacakNesne({required this.ihtiyacAdi, required this.adet});
}

class AlinacaklarListesi extends StatefulWidget {
  @override
  _AlinacaklarListesiState createState() => _AlinacaklarListesiState();
}

class _AlinacaklarListesiState extends State<AlinacaklarListesi> {
  List<AlinacakNesne> alinacaklarListesi = [
    AlinacakNesne(ihtiyacAdi: 'Pide', adet: 2),
    AlinacakNesne(ihtiyacAdi: 'Kola', adet: 1),
    AlinacakNesne(ihtiyacAdi: 'Süt', adet: 12),
    AlinacakNesne(ihtiyacAdi: 'Çay', adet: 5),
    AlinacakNesne(ihtiyacAdi: 'Peynir', adet: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alınacaklar Listesi'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Burada arama yapılacak işlemleri ekleyebilirsiniz.
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: alinacaklarListesi.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(alinacaklarListesi[index].ihtiyacAdi),
              subtitle: Text('Adet: ${alinacaklarListesi[index].adet}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Yeni bir alınacak ekleme işlemleri burada yapılacak.
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
