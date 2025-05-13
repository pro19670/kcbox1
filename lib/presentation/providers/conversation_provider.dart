import 'package:flutter/material.dart';
// import 'package:household_inventory_app/services/nlp_service.dart';
import '../../services/nlp_service.dart';

class ConversationTurn {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ConversationTurn({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class ConversationProvider extends ChangeNotifier {
  final List<ConversationTurn> _conversation = [];
  final NlpService _nlpService = NlpService(); // ✅ NLP 서비스 주입

  List<ConversationTurn> get conversation => List.unmodifiable(_conversation);

  void handleUserInput(String text) {
    addUserInput(text);
  }

  void addUserInput(String userText) {
    _conversation.add(
      ConversationTurn(
        text: userText,
        isUser: true,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();

    _processAIResponse(userText);
  }

  void _processAIResponse(String userText) async {
    await Future.delayed(const Duration(seconds: 1)); // 응답 시뮬레이션

    String reply = _nlpService.getResponse(userText); // ✅ 실제 NLP 서비스 사용

    _conversation.add(
      ConversationTurn(
        text: reply,
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void clearConversation() {
    _conversation.clear();
    notifyListeners();
  }
}
