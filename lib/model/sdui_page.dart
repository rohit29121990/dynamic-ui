import 'package:flutter/material.dart';

class SduiPage {
  final String type;
  final SduiComponent appBar;
  final SduiComponent child;

  SduiPage({required this.type, required this.appBar, required this.child});

  factory SduiPage.fromJson(Map<String, dynamic> json) {
    return SduiPage(
      type: json['type'] ?? '',
      appBar: SduiComponent.fromJson(json['appBar']),
      child: SduiComponent.fromJson(json['child']),
    );
  }
}

class SduiComponent {
  final String type;
  final Map<String, dynamic> attributes;
  final List<SduiComponent> children;
  final SduiAction? action;

  SduiComponent({
    required this.type,
    required this.attributes,
    required this.children,
    this.action,
  });

  factory SduiComponent.fromJson(Map<String, dynamic> json) {
    return SduiComponent(
      type: json['type'] ?? '',
      attributes: json['attributes'] ?? {},
      children: json['children'] != null
          ? List<SduiComponent>.from(
              json['children'].map((c) => SduiComponent.fromJson(c)),
            )
          : [],
      action:
          json['action'] != null ? SduiAction.fromJson(json['action']) : null,
    );
  }
}

class SduiAction {
  final String type;
  final String url;
  final SduiComponent? prompt;

  SduiAction({required this.type, required this.url, this.prompt});

  factory SduiAction.fromJson(Map<String, dynamic> json) {
    return SduiAction(
      type: json['type'] ?? '',
      url: json['url'] ?? '',
      prompt: json['prompt'] != null
          ? SduiComponent.fromJson(json['prompt'])
          : null,
    );
  }
}
