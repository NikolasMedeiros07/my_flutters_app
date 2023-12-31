import 'package:chat_flutter/auth_service.dart';
import 'package:chat_flutter/screens/chat_screen.dart';
import 'package:chat_flutter/screens/register_screen.dart';
import 'package:flutter/material.dart';

class EnterRoomScreen extends StatefulWidget {
  const EnterRoomScreen({Key? key}) : super(key: key);

  @override
  _EnterRoomScreenState createState() => _EnterRoomScreenState();
}

class _EnterRoomScreenState extends State<EnterRoomScreen> {
  final AuthService _auth = AuthService(); // Crie uma instância do AuthService
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0XFF23272a),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Seja Bem Vindo',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                _emailInput(),
                const SizedBox(height: 12),
                _passwordInput(),
                const SizedBox(height: 12),
                _enterButton(context),
                const SizedBox(height: 12),
                _registerButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailInput() {
    return TextFormField(
      controller: _emailController,
      cursorColor: const Color(0xff9b84ec),
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.all(20.0),
        filled: true,
        fillColor: Color(0xff2f3136),
        labelText: 'E-mail',
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff9b84ec), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      controller: _passwordController,
      cursorColor: const Color(0xff9b84ec),
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.all(20.0),
        filled: true,
        fillColor: Color(0xff2f3136),
        labelText: 'Senha',
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff9b84ec), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  Widget _enterButton(context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              final email = _emailController.text.trim();
              final parts = email.split('@');
              final name = parts[0];
              final password = _passwordController.text.trim();

              if (email.isNotEmpty && password.isNotEmpty) {
                final user =
                    await _auth.signInWithEmailAndPassword(email, password);
                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(userName: name),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Falha no login. Verifique suas credenciais.'),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Por favor, preencha todos os campos.'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              backgroundColor: const Color(0xff9b84ec),
            ),
            child: const Text('Entrar'),
          ),
        ),
      ],
    );
  }

  Widget _registerButton(context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const RegisterScreen();
              }));
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              backgroundColor: const Color(0xff9b84ec),
            ),
            child: const Text('Registrar'),
          ),
        ),
      ],
    );
  }
}
