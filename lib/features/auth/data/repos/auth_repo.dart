import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../services/supabase_auth_service.dart';

class AuthRepo {
  final SupabaseAuthService _supabaseAuthService;

  AuthRepo({required SupabaseAuthService supabaseAuthService})
    : _supabaseAuthService = supabaseAuthService;

  Future<Either<Failure, AuthResponse>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _supabaseAuthService.loginWithEmail(
        email: email,
        password: password,
      );
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, AuthResponse?>> loginWithGoogle() async {
    try {
      final AuthResponse? response = await _supabaseAuthService
          .loginWithGoogle();
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, AuthResponse>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _supabaseAuthService.register(
        email: email,
        password: password,
      );
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await _supabaseAuthService.forgotPassword(email: email);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
