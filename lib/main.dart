// 🟢 2025-05-11 · 클래스명 변경 for widget_test.dart 연동
import 'package:flutter/material.dart';
import ' inventory_manager.dart';
import 'inventory_item.dart'; // InventoryItem 데이터 모델 파일 임포트
import 'inventory_manager.dart'; // InventoryManager 목록 관리 파일 임포트

void main() {
  runApp(const KCBox1App()); // 앱 실행
}

// KCBox1App 클래스는 전체 앱의 구조를 정의
class KCBox1App extends StatelessWidget {
  const KCBox1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Household Inventory App', // 앱 제목
      theme: ThemeData(
        primarySwatch: Colors.indigo, // 기본 색상 테마
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(), // 홈 화면으로 HomePage 위젯 설정 (const 제거)
    );
  }
}

// HomePage 클래스는 인벤토리 홈 화면을 정의 (StatefulWidget으로 변경)
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final InventoryManager inventoryManager = InventoryManager(); // 물품 관리 인스턴스 생성

  // 테스트용 초기 물품 추가 (나중에 삭제하거나 실제 데이터 로드 로직으로 대체)
  @override
  void initState() {
    super.initState();
    inventoryManager.addItem(InventoryItem(name: '테스트 물품 1', description: '첫 번째 물품입니다.', imageUrl: '', quantity: 1));
    inventoryManager.addItem(InventoryItem(name: '테스트 물품 2', description: '두 번째 물품입니다.', imageUrl: '', quantity: 5));
  }

  // 물품 추가 다이얼로그를 띄우는 함수
  void _addInventoryItem() {
    // 다이얼로그를 띄우는 함수
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        String description = '';
        int quantity = 1; // 기본 수량 설정

        return AlertDialog(
          title: const Text('물품 추가'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: '물품 이름'),
                onChanged: (value) {
                  name = value; // 입력된 이름 저장
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: '물품 설명'),
                onChanged: (value) {
                  description = value; // 입력된 설명 저장
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: '수량'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value) ?? 1; // 입력된 수량 저장 (기본값 1)
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // 물품 추가 버튼 클릭 시
                if (name.isNotEmpty) {
                  // 이름이 비어있지 않으면 물품 추가
                  inventoryManager.addItem(InventoryItem(
                    name: name,
                    description: description,
                    imageUrl: '', // 이미지 URL은 나중에 추가할 수 있어
                    quantity: quantity,
                  ));
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                  setState(() {}); // 상태 업데이트
                }
              },
              child: const Text('추가'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Text('취소'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Home'), // 앱바 제목
        backgroundColor: Theme.of(context).primaryColor, // 앱바 배경색
      ),
      body: Column(
        children: [
          Expanded( // ListView가 남은 공간을 모두 차지하도록 설정
            child: ListView.builder(
              itemCount: inventoryManager.getItems().length, // 물품 개수
              itemBuilder: (context, index) {
                final item = inventoryManager.getItems()[index]; // 해당 인덱스의 물품 가져오기
                return ListTile( // 물품 하나를 표시하는 위젯
                  leading: item.imageUrl.isNotEmpty // 이미지가 있다면 표시
                      ? Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover) // 웹 이미지 로드
                      : Icon(Icons.inventory), // 이미지가 없으면 기본 아이콘 표시
                  title: Text(item.name), // 물품 이름
                  subtitle: Text('${item.description}\n수량: ${item.quantity}'), // 물품 설명 및 수량
                  isThreeLine: true, // Subtitle이 두 줄 이상일 수 있도록 설정
                  onTap: () {
                    // TODO: 물품 클릭 시 상세 화면으로 이동하는 로직 구현
                    print('물품 클릭됨: ${item.name}'); // 임시로 로그 출력
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton( // 물품 추가 버튼
              onPressed: _addInventoryItem, // 버튼 클릭 시 _addInventoryItem 함수 실행
              child: const Text('물품 추가'),
            ),
          ),
        ],
      ),
    );
  }
}
