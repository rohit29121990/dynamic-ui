import 'package:equatable/equatable.dart';

abstract class SduiEvent extends Equatable {
  const SduiEvent();

  @override
  List<Object> get props => [];
}

class FetchSduiPage extends SduiEvent {
  final String url;
  const FetchSduiPage({required this.url});
  @override
  List<Object> get props => [url];
}
