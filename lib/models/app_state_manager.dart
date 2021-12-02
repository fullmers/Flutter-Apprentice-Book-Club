import 'package:apod/features/shared/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ApodTab {
  static const int today = 0;
  static const int recent = 1;
  static const int favorites = 2;
  static const int journal = 3;
}

class AppStateManager extends ChangeNotifier {
  AppStateManager() {
    // Set up a listener that informs our UI any
    // time the active user changes.
    _firebaseAuth.userChanges().listen(
      (firebase_auth.User? firebaseUser) {
        user = firebaseUser?.toUser();
        notifyListeners();
      },
    );
  }

  bool _initialized = false;
  int _selectedTab = ApodTab.today;
  User? user;
  String? authError;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => user != null;
  int get selectedTab => _selectedTab;

  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();
  final firebase_auth.FirebaseAuth _firebaseAuth =
      firebase_auth.FirebaseAuth.instance;

  void initializeApp() {
    _initialized = true;
    notifyListeners();
  }

  void login(String username, String password) {
    // Don't use this anymore - we're replacing auth with Google Sign In
    // _loggedIn = true;
    notifyListeners();
  }

  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCred = await _firebaseAuth.signInWithCredential(credential);
      if (userCred.user != null) {
        authError = null;
        user = userCred.user!.toUser();
      } else {
        authError = 'Unknown auth error';
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      authError = e.toString();
    } on Exception catch (e) {
      // ignore: avoid_print
      print('Unexpected logInWithGoogle Exception: $e');
      authError = 'Unknown auth error';
    }
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  /// Useful for deep links to a single tab. Should not be used
  /// during normal navigation.
  void silentlySetTab(int index) {
    _selectedTab = index;
  }

  void goToRecentApods() {
    _selectedTab = ApodTab.recent;
    notifyListeners();
  }

  void logout() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}

final AppStateManager appStateManager = AppStateManager();

extension on firebase_auth.User {
  User toUser() => User(
        id: uid,
        email: email,
      );
}
