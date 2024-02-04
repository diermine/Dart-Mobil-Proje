import 'dart:io';

import 'package:flutter/material.dart';
import 'HesapMakinesi.dart'; // HesapMakinesi sayfasının bulunduğu dosya
import 'SonucListesi.dart';
import 'AlınacaklarListesi.dart'; // Yeni eklenen AlinacaklarListesi sayfasının dosyası

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<HesapMakinesiIslem> _hesapMakinesiIslemleri = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '1226706039',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Color(0xFF212630),
      ),
      body: Center(
        child: _buildPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Çıkış',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Hesap Makinesi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Alınacaklar Listesi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HesapMakinesi(hesapMakinesiIslemleri: _hesapMakinesiIslemleri),
          ),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlinacaklarListesi(),
          ),
        );
      } else if (index == 0) {
        exit(0);
      }
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Center(
          child: ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF212630)),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Çıkış',
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              ),
            ),
          ),
        );
      case 1:
        return HesapMakinesi(hesapMakinesiIslemleri: _hesapMakinesiIslemleri);
      case 2:
        return Center(
          child: Text('Alınacaklar Listesi Sayfası İçeriği'),
        );
      default:
        return Center(
          child: Text('Bilinmeyen Sayfa'),
        );
    }
  }
}
