import 'package:flutter/material.dart';
import 'package:moodin_app/measure/measure_view.dart';

class HomeView extends StatelessWidget {
  final String username; // "무딘 님"에 해당하는 이름

  const HomeView({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/images/cloud.png', // 구름 배경이 있다면 실제 경로 지정
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '오늘 $username 님의 스트레스 신호를\n확인해 보세요!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF37474F),
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/measureicon.png', // 이미지 경로 맞춰줘
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFECB3),
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MeasureView(),
                    ),
                  );
                },
                child: const Text(
                  '측정 하러 가기 >',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('마이페이지', style: TextStyle(fontSize: 14, color: Colors.black87)),
                  SizedBox(width: 16),
                  Text('|', style: TextStyle(fontSize: 14, color: Colors.black45)),
                  SizedBox(width: 16),
                  Text('마인드일지', style: TextStyle(fontSize: 14, color: Colors.black87)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
