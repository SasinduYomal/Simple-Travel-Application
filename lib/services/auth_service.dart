import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // GoogleSignIn instance එක හදද්දී මෙහෙම පාවිච්චි කරන්න
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // 1. Email/Password Register
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Auth Error Code: ${e.code}");
      return null;
    } catch (e) {
      print("❌ Unknown Error: ${e.toString()}");
      return null;
    }
  }

  // 2. Email/Password Login
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      print("❌ Login Error Code: ${e.code}");
      return null;
    } catch (e) {
      print("❌ Unknown Error: ${e.toString()}");
      return null;
    }
  }

  // 3. Google Sign-In (Fixed errors from image_017519.png)
  Future<User?> signInWithGoogle() async {
    try {
      // 'signIn()' එකේ 'I' අකුර අනිවාර්යයෙන්ම Capital විය යුතුයි
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Access Token සහ Id Token පාවිච්චි කරද්දී Null safety ගැන සැලකිලිමත් වන්න
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      return result.user;
    } catch (e) {
      print("❌ Google Sign-In Error: ${e.toString()}");
      return null;
    }
  }

  // 4. Auth State Stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // 5. Sign Out
  Future<void> signOut() async {
    try {
      // Google සහ Firebase දෙකෙන්ම sign out වෙන්න ඕනේ
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print("❌ SignOut Error: ${e.toString()}");
    }
  }
}