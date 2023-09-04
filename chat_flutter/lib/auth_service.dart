import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Função para realizar o login
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      print('Erro ao fazer login: $error');
      return null;
    }
  }

  // Função para realizar o registro
  Future<User?> registerWithEmailAndPasswordWithDisplayName(String name, String email, String password) async {
    try {
      final UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = authResult.user;

      if (user != null) {
        // Define o nome de exibição do usuário no Firebase
        await user.updateDisplayName(name);
      }

      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
