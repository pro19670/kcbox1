// lib/presentation/services/nlp_service.dart

class NlpService {
  String getResponse(String input) {
    if (input.contains("추가")) {
      return "물품을 추가하시겠어요?";
    } else if (input.contains("삭제")) {
      return "정말 삭제할까요?";
    } else {
      return "죄송해요. 아직 그건 이해하지 못했어요.";
    }
  }
}
