import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home/gasto_home.dart';

//Entrada
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const Gasto());
}

class Gasto extends StatelessWidget {
  const Gasto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoApp(
            title: 'Personal Expenses',
            theme: CupertinoThemeData(
              barBackgroundColor: Colors.amber,
              primaryColor: Colors.purple,
            ),
          )
        : MaterialApp(
            title: 'Personal Expenses',
            theme: ThemeData(
              primaryColor: Colors.purple,
              errorColor: Colors.red,
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                  .copyWith(secondary: Colors.amber),
              fontFamily: 'Quicksand',
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              appBarTheme: AppBarTheme(
                toolbarTextStyle: ThemeData.light()
                    .textTheme
                    .copyWith(
                      headline6: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    .bodyText2,
                titleTextStyle: ThemeData.light()
                    .textTheme
                    .copyWith(
                      headline6: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    .headline6,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const GastoHome(),
          );
  }
}
