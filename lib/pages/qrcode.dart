import 'package:flutter/material.dart';
import 'package:weather/screen/scanqr.dart';

class QRcode extends StatelessWidget {
  static const String routeName = "qrcode";

  const QRcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("QRcode"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => ScanScreen()));
                    print('scanqrsensor');
                  },
                  child: Text('scanqrsensor'))
            ],
          )),
    );
  }
}