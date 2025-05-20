import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_model.dart';
import 'auth_state.dart';
import 'dart:developer';


class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthCubit() : super(const AuthState.initial()) {
    // Listen to auth state changes
    _firebaseAuth.authStateChanges().listen((user) async {
      log('Auth state changed: User ${user?.uid ?? 'null'}');
      await checkAuth();
    });
    // Initial check
    log('Initial auth check');
    checkAuth();
  }

  Future<void> checkAuth() async {
    try {
      final user = _firebaseAuth.currentUser;
      log('Checking auth: User ${user?.uid ?? 'null'}');
      if (user != null) {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        if (doc.exists) {
          final userModel = UserModel.fromJson(doc.data()!);
          log('Emitting authenticated state for user: ${userModel.email}');
          emit(AuthState.authenticated(user: userModel));
        } else {
          log('No Firestore profile found for user: ${user.uid}');
          emit(const AuthState.unauthenticated());
        }
      } else {
        log('No user signed in');
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      log('Error checking auth: $e');
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> signOut() async {
    try {
      log('Signing out');
      await _firebaseAuth.signOut();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      log('Error signing out: $e');
    }
  }
}