import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🏠 KCBox 홈')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: 이미지 업로드 화면 이동
              },
              child: const Text("📷 이미지로 분류 시작"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: 저장소별 항목 보기 화면 이동
              },
              child: const Text("📦 저장소 보기"),
            ),
          ],
        ),
      ),
    );
  }
}
