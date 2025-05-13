import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presentation/providers/conversation_provider.dart';
import '../presentation/widgets/smart/voice_input_button.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConversationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("AI 대화 인터페이스")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.conversation.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Align(
                  alignment: provider.conversation[index].isUser
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: provider.conversation[index].isUser
                          ? Colors.grey[300]
                          : Colors.indigo[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(provider.conversation[index].text),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: '명령어를 입력하세요...'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  provider.handleUserInput(_controller.text);
                  _controller.clear();
                },
              ),
              VoiceInputButton(
                onResult: (text) {
                provider.handleUserInput(text);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
