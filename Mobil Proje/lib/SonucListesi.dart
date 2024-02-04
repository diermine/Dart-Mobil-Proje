import 'package:flutter/material.dart';
import 'main.dart';

class HesapMakinesiIslem {
  String islem;
  double sonuc;

  HesapMakinesiIslem({required this.islem, required this.sonuc});
}

class SonucListesi extends StatelessWidget {
  final List<HesapMakinesiIslem> hesapMakinesiIslemleri;

  SonucListesi({required this.hesapMakinesiIslemleri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuçlar'),
      ),
      body: ListView.builder(
        itemCount: hesapMakinesiIslemleri.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hesapMakinesiIslemleri[index].islem),
            subtitle: Text('Sonuç: ${hesapMakinesiIslemleri[index].sonuc}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },
        label: Text(
          'Anasayfa',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        icon: Icon(
          Icons.home,
          color: Colors.green,
        ),
        backgroundColor: Color(0xFF212630),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}