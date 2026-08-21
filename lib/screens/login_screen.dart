import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Simulación de login exitoso
    Navigator.pushReplacementNamed(context, '/quote');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: "Contraseña")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text("Iniciar Sesión"))
          ],
        ),
      ),
    );
  }
}
