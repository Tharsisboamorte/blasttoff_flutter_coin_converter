import 'package:flutter/material.dart';


void main() {
  runApp(const MaterialApp(
    home: UiHome(),
  ));
}

class UiHome extends StatefulWidget {
  const UiHome({Key? key}) : super(key: key);

  @override
  State<UiHome> createState() => _UiHomeState();
}

double dolar = 0.0;
double euroServer = 0.0;
double bitcoin = 0.0;

class _UiHomeState extends State<UiHome> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final bitcoinController = TextEditingController();

  void _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real * dolar).toStringAsFixed(2);
    euroController.text = (real * euroServer).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(7);
  }

  void _dolarChanged(String text) {
    double dollar = double.parse(text);
    realController.text = (dolar * dollar).toStringAsFixed(2);
    euroController.text = (dolar * dollar / euroServer).toStringAsFixed(2);
    bitcoinController.text = (dolar * dollar / bitcoin).toStringAsFixed(7);
  }

  void _euroChanged(String text) {
    double euro = double.parse(text);
    realController.text = (euro * euroServer).toStringAsFixed(2);
    dolarController.text = (euro * euroServer / dolar).toStringAsFixed(2);
    bitcoinController.text = (euro * euroServer / bitcoin).toStringAsFixed(7);
  }

  void _bitcoinChanged(String text) {
    double bitcoin = double.parse(text);
    realController.text = (bitcoin * bitcoin).toStringAsFixed(2);
    dolarController.text = (bitcoin * bitcoin / dolar).toStringAsFixed(2);
    euroController.text = (bitcoin * bitcoin / euroServer).toStringAsFixed(2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 35.0,
                  bottom: 20.0
              ),
              child: Row(
                children: [
                  const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.white, size: 100.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text.rich(
                          style: TextStyle(fontSize: 19.0),
                          textAlign: TextAlign.start,
                          TextSpan(
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(text: "Conversor de"),
                                TextSpan(
                                    text: " moedas",
                                    style: TextStyle(
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        Text(
                          "Toodoo - Desenvolvimento Software",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo_dinheiro.png")),
                  borderRadius:
                  BorderRadiusDirectional.all(Radius.circular(25.0)),
                  color: Colors.white54,
                ),
                alignment: Alignment.center,
                height: 450.0,
                width: 400.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTextField("Real", realController, _realChanged),
                      Divider(),
                      buildTextField("Dolar", dolarController, _dolarChanged),
                      Divider(),
                      buildTextField("Euro", euroController, _euroChanged),
                      Divider(),
                      buildTextField("Bitcoin", bitcoinController, _bitcoinChanged),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String label,
    TextEditingController textController,
    Function changedText,) {
  return TextField(
    controller: textController,
    decoration: InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 5),
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 5)),
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    style: const TextStyle(
        color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
    onChanged: (text) {
      changedText(text);
    },
    keyboardType: TextInputType.number,
  );
}

