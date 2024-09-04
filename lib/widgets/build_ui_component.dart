import 'package:dy/model/sdui_page.dart';
import 'package:dy/widgets/app_bar.dart';

import 'package:flutter/material.dart';

import 'show_prompt.dart';

Widget buildUiComponent(BuildContext context, SduiComponent component) {
  final screenHeight = MediaQuery.of(context).size.height;
  switch (component.type) {
    case 'AppBar':
      return DyAppBar(
          screenHeight: screenHeight,
          title: component.attributes['title'] ?? '');
    case 'Form':
      return Padding(
        padding:
            EdgeInsets.all(component.attributes['padding']?.toDouble() ?? 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: component.children
                .map((child) => buildUiComponent(context, child))
                .toList(),
          ),
        ),
      );
    case 'Input':
      return TextFormField(
        decoration: InputDecoration(
          labelText: component.attributes['caption'],
          counterText: '',
        ),
        maxLength: component.attributes['maxLength'],
        initialValue: component.attributes['value'],
      );
    case 'Button':
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ElevatedButton(
          onPressed: () {
            if (component.action != null) {
              _handleAction(context, component.action!);
            }
          },
          child: Text(component.attributes['caption'] ?? ''),
        ),
      );
    default:
      return Container();
  }
}

void _handleAction(BuildContext context, SduiAction action) {
  print('Action triggered: ${action.type}');
  if (action.type == 'Command') {
    if (action.prompt == null) return;

    showPrompt(context, action.prompt!);
  }
}
