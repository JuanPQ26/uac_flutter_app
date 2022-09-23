import 'package:flutter/material.dart';

import 'package:uac_flutter_app/src/views/widgets/message_dialog.dart';

class StrengthView extends StatefulWidget {
  const StrengthView({super.key});

  @override
  State<StrengthView> createState() => _StrengthViewState();
}

class _StrengthViewState extends State<StrengthView> {
  static const TextStyle subTitleStyle =
      TextStyle(fontSize: 15, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const StrengthForm()
        ],
      ),
    );
  }
}

class StrengthForm extends StatelessWidget {
  static final _strengthForm = GlobalKey<FormState>();

  static final _massController = TextEditingController();
  static final _accelerationController = TextEditingController();

  const StrengthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _strengthForm,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: _massController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor ingresa un valor";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: "Masa", filled: true),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _accelerationController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa un valor";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "Aceleracion", filled: true),
              )),
          TextButton(
              onPressed: () {
                if (_strengthForm.currentState!.validate()) {
                  final num massValue = double.parse(_massController.text);

                  final num accelerationValue =
                      double.parse(_accelerationController.text);

                  showDialog(
                      context: context,
                      builder: (context) {
                        return MessageDialog(
                            title: "Resultado",
                            message:
                                "El resultado es: ${massValue * accelerationValue}");
                      });

                  _massController.text = "";
                  _accelerationController.text = "";
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
