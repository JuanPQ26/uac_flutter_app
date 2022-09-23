import 'package:flutter/material.dart';
import 'package:uac_flutter_app/src/resources/math.dart' as math;
import 'package:uac_flutter_app/src/views/widgets/message_dialog.dart';

class FactorialView extends StatefulWidget {
  const FactorialView({super.key});

  @override
  State<FactorialView> createState() => _FactorialViewState();
}

class _FactorialViewState extends State<FactorialView> {
  final TextStyle appBarTitleStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontSize: 25,
      fontWeight: FontWeight.w800);

  final TextStyle subTitleStyle =
      const TextStyle(fontSize: 15, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Factorial'),
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
                        image: AssetImage("assets/images/math-homework.png"))),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ingresa el valor a calcular',
                    style: subTitleStyle,
                  )),
              const FactorialForm()
            ],
          ),
        ));
  }
}

class FactorialForm extends StatelessWidget {
  static final _factorialForm = GlobalKey<FormState>();

  static final _factorialController = TextEditingController();

  const FactorialForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _factorialForm,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _factorialController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa un valor";
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(hintText: "Factorial", filled: true),
              )),
          TextButton(
              onPressed: () {
                if (_factorialForm.currentState!.validate()) {
                  final num result =
                      math.factorial(double.parse(_factorialController.text));

                  // show factorial result
                  showDialog(
                      context: context,
                      builder: (context) {
                        return MessageDialog(
                            title: "Resultado",
                            message: "El resultado es: $result");
                      });

                  // clear input text field
                  _factorialController.text = "";
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
