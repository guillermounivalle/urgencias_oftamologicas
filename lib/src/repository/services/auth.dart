
import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> createUserWithEmailAndPassword(String email, String password);
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class AuthService implements AuthBase{

  //Se crea una instancia. Una clase Singleton anteriormente
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override  //@override porque está definida en la clase abstracta arriba
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> signInWithEmailAndPassword(String email, String password) async{
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

  @override
  Future<User?> createUserWithEmailAndPassword(String email, String password) async{
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return userCredential.user;
  }

  @override  //@override porque est{a definida en la clase abstracta arriba
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}