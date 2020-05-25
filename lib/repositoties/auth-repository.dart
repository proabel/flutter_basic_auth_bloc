
abstract class AuthRepository{
  Future signInWithEmail(String email, String password);

  Future isSignedIn();

  Future currentUser();

  Future signOut();
}