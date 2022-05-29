import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String?> signIn(String email, String password);
  Future<String?> signUp(String email, String password);
  Future<User?> getCurrentUser();
  Future<void> sendEmailVerification();
  Future<void> signOut();
  Future<bool> isEmailVerified();
}

class Auth implements BaseAuth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }

  @override
  Future<bool> isEmailVerified() async {
    User user = firebaseAuth.currentUser!;
    return user.emailVerified;
  }

  @override
  Future<void> sendEmailVerification() async {
    User user = firebaseAuth.currentUser!;
    user.sendEmailVerification();
  }

  @override
  Future<String?> signIn(String email, String password) async {
    UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = authResult.user;
    return user?.uid;
  }

  @override
  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  @override
  Future<String?> signUp(String email, String password) async {
    UserCredential authResult = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = authResult.user;
    return user?.uid;
  }
}
