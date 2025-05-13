import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextService {
  final SpeechToText _speech = SpeechToText();

  Future<String> listen() async {
    bool available = await _speech.initialize();
    if (available) {
      await _speech.listen();
      return "음성 인식 결과";
    }
    return "인식 실패";
  }
}
