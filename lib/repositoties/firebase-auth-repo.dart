
import './../repositoties/auth-repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepository{
  final _firebaseAuth = FirebaseAuth.instance;


  @override
  Future currentUser() async{
    FirebaseUser authUser = await _firebaseAuth.currentUser();
    //var user = await _firestore.collection('users').where('userAuthID', isEqualTo: authUser.uid).getDocuments();
    return authUser;
  }

  @override
  Future isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  @override
  Future signInWithEmail(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((user){
      return user;
    }).catchError((e){
      return e;
    });
    //var user = await _firestore.collection('users').where('userAuthID', isEqualTo: authUser.user.uid).getDocuments();
  }

  @override
  Future signOut() {
    return _firebaseAuth.signOut();
  }

}
