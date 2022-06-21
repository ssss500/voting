import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class VotingFirebaseUser {
  VotingFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

VotingFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<VotingFirebaseUser> votingFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<VotingFirebaseUser>((user) => currentUser = VotingFirebaseUser(user));
