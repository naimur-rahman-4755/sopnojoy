import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_local_datasource.dart';
import '../domain/auth_repository.dart';
import '../domain/auth_repository_impl.dart';

final authLocalDataSourceProvider =
Provider<AuthLocalDataSource>((ref) => AuthLocalDataSource());

final authRepositoryProvider = Provider<AuthRepository>(
      (ref) => AuthRepositoryImpl(ref.read(authLocalDataSourceProvider)),
);