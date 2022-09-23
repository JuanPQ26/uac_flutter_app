import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:uac_flutter_app/src/views/widgets/message_dialog.dart';

class PotencyView extends StatefulWidget {
  const PotencyView({super.key});

  @override
  State<PotencyView> createState() => _PotencyViewState();
}

class _PotencyViewState extends State<PotencyView> {
  static const TextStyle appBarTitleStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontSize: 25,
      fontWeight: FontWeight.w800);

  static const TextStyle subTitleStyle =
      const TextStyle(fontSize: 15, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Potencia'),
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: appBarTitleStyle,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/mathematics.png"))),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ingresa los valores a calcular',
                    style: subTitleStyle,
                  )),
              const PotencyForm()
            ],
          ),
        ));
  }
}

class PotencyForm extends StatelessWidget {
  static final _potencyForm = GlobalKey<FormState>();

  static final _baseController = TextEditingController();
  static final _exponentController = TextEditingController();

  const PotencyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _potencyForm,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: _baseController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor ingresa un valor";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: "Base", filled: true),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _exponentController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa un valor";
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(hintText: "Exponente", filled: true),
              )),
          TextButton(
              onPressed: () {
                if (_potencyForm.currentState!.validate()) {
                  final num baseValue = double.parse(_baseController.text);
                  final num exponentValue =
                      double.parse(_exponentController.text);

                  showDialog(
                      context: context,
                      builder: (context) {
                        return MessageDialog(
                            title: "Resultado",
                            message:
                                "El resultado es: ${math.pow(baseValue, exponentValue)}");
                      });

                  _baseController.text = "";
                  _exponentController.text = "";
                }
              },
              child: const Text("Calcular")),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Volver"))
        ],
      ),
    );
  }
}
