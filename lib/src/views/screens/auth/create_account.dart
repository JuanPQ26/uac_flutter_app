import 'package:flutter/material.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _createAccountFormKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _createAccountFormKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa un nombre de usuario";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    filled: true, hintText: "Nombre de usuario"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa un correo electronico";
                  } else if (!_emailRegExp.hasMatch(value)) {
                    return 'Por favor ingresa un correo valido';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    filled: true, hintText: "Correo electronico"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa una contraseña";
                  }
                  return null;
                },
                obscureText: true,
                decoration:
                    const InputDecoration(filled: true, hintText: "Contraseña"),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (_createAccountFormKey.currentState!.validate()) {
                    _usernameController.text = "";
                    _emailController.text = "";
                    _passwordController.text = "";
                    Navigator.pushNamed(context, "/");
                  }
                },
                child: const Text("Crear cuenta")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Regresar"))
          ],
        ));
  }
}

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  final titleStyle = const TextStyle(
      fontSize: 35, fontFamily: 'Montserrat', fontWeight: FontWeight.w800);
  final subTitleStyle = const TextStyle(fontSize: 15, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(25),
      child: Column(children: <Widget>[
        Container(
          width: 250,
          height: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login-logo.png"))),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Crear Cuenta',
              style: titleStyle,
            )),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Bienvenido, por favor ingresa tus credenciales',
            style: subTitleStyle,
          ),
        ),
        const CreateAccountForm(),
      ]),
    ));
  }
}
