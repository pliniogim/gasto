import 'package:flutter/material.dart';

import '../home/gasto_home.dart';

//Entrada
void main() {
  runApp(const Gasto());
}

class Gasto extends StatelessWidget {
  const Gasto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GastoHome(),
    );
  }
}
