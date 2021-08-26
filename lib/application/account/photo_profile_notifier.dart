/* import 'dart:io';

import 'package:base_de_projet/domain/auth/server_failure.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Ajouter freezed !
abstract class PhotoProfileState {
  const PhotoProfileState();
}

class PhotoInitial extends PhotoProfileState {
  const PhotoInitial();
}

class PhotoLoaded extends PhotoProfileState {
  const PhotoLoaded();
}

class PhotoLoading extends PhotoProfileState {
  const PhotoLoading();
}

class AuthNotifier extends StateNotifier<PhotoProfileState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(PhotoInitial());

  String load() {
    return "";
  }

  Future<Either<ServerFailure, Unit>> uploadPhoto(File photo) {
    return _authRepository.uploadPhotoProfile(photo);
  }
}
 */