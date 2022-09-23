import 'package:flutter/material.dart';
import 'package:uac_flutter_app/src/views/widgets/message_dialog.dart';

class DistanceView extends StatefulWidget {
  const DistanceView({super.key});

  @override
  State<DistanceView> createState() => _DistanceViewState();
}

class _DistanceViewState extends State<DistanceView> {
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
          const DistanceForm()
        ],
      ),
    );
  }
}

class DistanceForm extends StatelessWidget {
  static final _distanceForm = GlobalKey<FormState>();

  static final _velocityController = TextEditingController();
  static final _timeController = TextEditingController();

  const DistanceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _distanceForm,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: _velocityController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor ingresa un valor";
                }
                return null;
              },
              decoration:
                  const InputDecoration(hintText: "Velocidad", filled: true),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _timeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa un valor";
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(hintText: "Tiempo", filled: true),
              )),
          TextButton(
              onPressed: () {
                if (_distanceForm.currentState!.validate()) {
                  final num velocityValue =
                      double.parse(_velocityController.text);

                  final num timeValue = double.parse(_timeController.text);

                  showDialog(
                      context: context,
                      builder: (context) {
                        return MessageDialog(
                            title: "Resultado",
                            message:
                                "El resultado es: ${velocityValue * timeValue}");
                      });

                  _velocityController.text = "";
                  _timeController.text = "";
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
