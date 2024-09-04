import 'package:dy/model/sdui_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sdui_event.dart'; // Import your event class
import 'sdui_state.dart'; // Import your state class
import 'package:http/http.dart' as http;
import 'dart:convert';

class SduiBloc extends Bloc<SduiEvent, SduiState> {
  SduiBloc() : super(SduiInitial()) {
    on<FetchSduiPage>(_onFetchSduiPage);
  }

  void _onFetchSduiPage(FetchSduiPage event, Emitter<SduiState> emit) async {
    emit(SduiLoading());
    try {
      final response = await http.get(Uri.parse(event.url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final sduiPage = SduiPage.fromJson(json);
        emit(SduiLoaded(sduiPage: sduiPage));
      } else {
        emit(SduiError());
      }
    } catch (e) {
      emit(SduiError());
    }
  }
}
