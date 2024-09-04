import 'package:equatable/equatable.dart';

import '../model/sdui_page.dart'; // Assume this imports the SduiPage model

abstract class SduiState extends Equatable {
  const SduiState();

  @override
  List<Object> get props => [];
}

class SduiInitial extends SduiState {}

class SduiLoading extends SduiState {}

class SduiLoaded extends SduiState {
  final SduiPage sduiPage;

  const SduiLoaded({required this.sduiPage});

  @override
  List<Object> get props => [sduiPage];
}

class SduiError extends SduiState {}
