import 'package:flutter/material.dart';
import 'SonucListesi.dart';

class HesapMakinesi extends StatefulWidget {
  final List<HesapMakinesiIslem> hesapMakinesiIslemleri;

  HesapMakinesi({Key? key, required this.hesapMakinesiIslemleri}) : super(key: key);

  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  String _display = '';
  String _currentValue = '';
  String _operator = '';
  double _result = 0;
  List<HesapMakinesiIslem> _hesapMakinesiIslemleri = [];

  void _onNumberPressed(String value) {
    setState(() {
      if (value == '0' && _currentValue == '0') {
        // Sıfırı çift olarak eklemeyi kontrol et
        _currentValue = '00';
      } else {
        _currentValue += value;
      }
      _display = _currentValue;
    });
  }

  void _onDeletePressed() {
    setState(() {
      if (_currentValue.isNotEmpty) {
        // Her basamak için silme işlemi
        _currentValue = _currentValue.substring(0, _currentValue.length - 1);
        _display = _currentValue.isEmpty ? '0' : _currentValue;
      }
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      if (_currentValue.isNotEmpty) {
        _result = double.parse(_currentValue);
        _currentValue = '';
      }
      _operator = operator;
    });
  }

  void _onEqualsPressed() {
    setState(() {
      if (_currentValue.isNotEmpty) {
        double secondNumber = double.parse(_currentValue);
        double islemSonucu = 0;
        switch (_operator) {
          case '+':
            islemSonucu = _result + secondNumber;
            break;
          case '-':
            islemSonucu = _result - secondNumber;
            break;
          case '×':
            islemSonucu = _result * secondNumber;
            break;
          case '÷':
            if (secondNumber != 0) {
              islemSonucu = _result / secondNumber;
            } else {
              _display = 'Error';
              return;
            }
            break;
        }
        _display = islemSonucu.toString();
        _currentValue = '';
        _hesapMakinesiIslemleri.add(HesapMakinesiIslem(
          islem: '$_result $_operator $secondNumber =',
          sonuc: islemSonucu,
        ));
        _result = islemSonucu;
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      if (_currentValue.isNotEmpty) {
        _currentValue = '';
        _display = '0';
      } else {
        _result = 0;
        _display = '';
        _operator = '';
        _hesapMakinesiIslemleri.clear();
      }
    });
  }

  void _onAllClearPressed() {
    setState(() {
      _currentValue = '';
      _result = 0;
      _display = '0';
      _operator = '';
      _hesapMakinesiIslemleri.clear();
    });
  }

  void _onSonucListesiPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SonucListesi(hesapMakinesiIslemleri: _hesapMakinesiIslemleri),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuçlar <----- Hesap Makinesi'),
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: _onSonucListesiPressed,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              _display,
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildOperatorButton('÷'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildOperatorButton('×'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildOperatorButton('-'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0'),
              _buildButton('00'),
              _buildButton('C'),
              _buildOperatorButton('+'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton('⌫', _onDeletePressed),
              _buildOperatorButton('='),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {
        _onNumberPressed(text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF212630),
        elevation: 5,
        padding: EdgeInsets.all(30),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.green),
      ),
    );
  }

  Widget _buildOperatorButton(String text) {
    return ElevatedButton(
      onPressed: () {
        if (text == '=') {
          _onEqualsPressed();
        } else if (text == 'C') {
          _onClearPressed();
        } else {
          _onOperatorPressed(text);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF212630),
        elevation: 5,
        padding: EdgeInsets.all(30),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.yellow),
      ),
    );
  }

  Widget _buildActionButton(String text, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF212630),
        elevation: 5,
        padding: EdgeInsets.all(30),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.green),
      ),
    );
  }
}
