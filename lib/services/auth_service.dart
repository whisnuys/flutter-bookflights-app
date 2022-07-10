import 'package:bookflights/models/user_model.dart';
import 'package:bookflights/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        balance: 280000000,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
