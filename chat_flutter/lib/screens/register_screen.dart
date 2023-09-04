import 'package:chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '/auth_service.dart'; // Importe o serviço de autenticação

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0XFF23272a),
        appBar: AppBar(
          title: const Text('Registro'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _emailInput(),
                const SizedBox(height: 12),
                _passwordInput(),
                const SizedBox(height: 12),
                _confirmPasswordInput(),
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
      style: const TextStyle(color: Colors.white),
      obscureText: true,
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

  Widget _confirmPasswordInput() {
    return TextFormField(
      controller: _confirmPasswordController,
      cursorColor: const Color(0xff9b84ec),
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.all(20.0),
        filled: true,
        fillColor: Color(0xff2f3136),
        labelText: 'Confirmar Senha',
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

  Widget _registerButton(context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              final email = _emailController.text.trim();
              final parts = email.split('@');
              final name = parts[0];
              final password = _passwordController.text.trim();
              final confirmPassword = _confirmPasswordController.text.trim();

              if (email.isNotEmpty &&
                  password.isNotEmpty &&
                  confirmPassword.isNotEmpty) {
                if (password == confirmPassword) {
                  final user =
                      await _auth.registerWithEmailAndPasswordWithDisplayName(
                          name, email, password);
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
                        content: Text(
                            'Falha no registro. Verifique as suas informações, o email precisa ser completo e a senha tem que ter mais de 6 caracteres'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('As senhas não coincidem. Tente novamente.'),
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
            child: const Text('Registrar'),
          ),
        ),
      ],
    );
  }
}
