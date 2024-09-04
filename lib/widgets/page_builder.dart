import 'package:dy/widgets/build_ui_component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sdui_bloc.dart';
import '../bloc/sdui_event.dart';
import '../bloc/sdui_state.dart';
import '../model/sdui_page.dart';

class SduiPageBuilder extends StatefulWidget {
  final String url;

  const SduiPageBuilder({super.key, required this.url});

  @override
  State<SduiPageBuilder> createState() => SduiPageBuilderState();
}

class SduiPageBuilderState extends State<SduiPageBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SduiBloc()..add(FetchSduiPage(url: widget.url)),
      child: BlocBuilder<SduiBloc, SduiState>(
        builder: (context, state) {
          if (state is SduiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SduiLoaded) {
            return _buildPage(context, state.sduiPage);
          } else if (state is SduiError) {
            return const Center(child: Text('Failed to load page.'));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, SduiPage sduiPage) {
    return Scaffold(
      appBar:
          buildUiComponent(context, sduiPage.appBar) as PreferredSizeWidget?,
      body: buildUiComponent(context, sduiPage.child),
    );
  }
}
