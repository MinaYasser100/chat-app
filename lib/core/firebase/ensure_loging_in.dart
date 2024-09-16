import 'package:firebase_auth/firebase_auth.dart';

bool ensureLogingIn() {
  if (FirebaseAuth.instance.currentUser == null) {
    return false;
  } else {
    return true;
  }
}
