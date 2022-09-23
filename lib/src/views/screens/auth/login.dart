import 'package:flutter/material.dart';
import 'package:uac_flutter_app/src/views/widgets/message_dialog.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              'Inicio de Sesion',
              style: titleStyle,
            )),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Bienvenido, por favor ingresa tus credenciales',
            style: subTitleStyle,
          ),
        ),
        const LoginForm(),
      ]),
    ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
                filled: true, hintText: "Correo electronico"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu correo electronico';
              } else if (!_emailRegExp.hasMatch(value)) {
                return 'Por favor ingresa un correo valido';
              }
              return null;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            controller: _passwordController,
            decoration:
                const InputDecoration(filled: true, hintText: "Contraseña"),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu contraseña';
              }
              return null;
            },
          ),
        ),
        TextButton(
            onPressed: () {
              if (_loginFormKey.currentState!.validate()) {
                bool emailIsValid = _emailController.text == "admin@mail.com";

                if (!emailIsValid) {
                  showDialog(
                      context: context,
                      builder: (context) => const MessageDialog(
                          title: "Correo electronico incorrecto",
                          message:
                              "Parece que el nombre de usuario que ingresaste no pertenece a ninguna cuenta."));
                  return;
                }

                bool passwordIsValid = _passwordController.text == "123456789";

                if (!passwordIsValid) {
                  showDialog(
                      context: context,
                      builder: (context) => const MessageDialog(
                          title: "Contraseña incorrecta",
                          message:
                              "La contraseña que ingresaste es incorrecta. Vuelve a intentarlo."));
                  return;
                }

                if (emailIsValid && passwordIsValid) {
                  _emailController.text = "";
                  _passwordController.text = "";

                  Navigator.pushNamed(context, "/");
                }
              }
            },
            child: const Text('Inciar sesion')),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/create-account');
            },
            child: const Text('Crear cuenta'))
      ]),
    );
  }
}
