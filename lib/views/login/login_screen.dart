import 'package:flutter/material.dart';
import 'package:olx_flutter/utils/utils.dart';
import 'package:olx_flutter/views/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Image.network(
                olxLogo,
                height: 150,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Acesse a sua conta',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Botão Login
            ElevatedButton(
              onPressed: () {
                // Aqui você adicionará a lógica de login no futuro.
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text('Não tem uma conta? Cadastre-se'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
