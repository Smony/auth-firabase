import 'package:banking/views/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<User> singInWithEmailAndPassword(String email, String pass) async {
    try {

      AuthResult result = await _fAuth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;

      return User.fromFirebase(user);
    } catch (e) { print(e); return null; }
  }

  Future<User> registerWithEmailAndPassword(String email, String pass) async {
    try {

      AuthResult result = await _fAuth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;

      return User.fromFirebase(user);
    } catch (e) { print(e); return null; }
  }

  Future logOut() async{
    await _fAuth.signOut();
  }

  Stream<User> get currentUser{
    return _fAuth.onAuthStateChanged
        .map((FirebaseUser user) => user != null ? User.fromFirebase(user) : null);
  }
}
