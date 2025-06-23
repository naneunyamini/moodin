import 'package:flutter/material.dart';
import 'measure_model.dart';
import 'measure_controller.dart';

class MeasureView extends StatefulWidget {
  const MeasureView({super.key});

  @override
  State<MeasureView> createState() => _MeasureViewState();
}

class _MeasureViewState extends State<MeasureView> {
  late MeasureModel _model;
  late MeasureController _controller;

  @override
  void initState() {
    super.initState();
    _model = MeasureModel();
    _controller = MeasureController(_model);
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildMeasureResult() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF3F5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/hrv.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'HRV',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF455A64),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/gsr.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'GSR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF455A64),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_model.hrv} ms',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_model.gsr} ms',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _controller.startMeasurement,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0E0E0),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
            ),
            child: const Text(
              '다시 측정하기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            // 결과 페이지 이동
          },
          child: const Text(
            '결과 보러가기 >',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );

  }

  Widget _buildBottomButton() {
    if (_model.isDone) return const SizedBox(); // 측정 완료되면 하단 버튼 숨김

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _model.isMeasuring ? null : _controller.startMeasurement,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8EC3D8),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          '측정 시작하기',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.grey),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'GSR ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0077A3),
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: '측정은 어떻게 하나요?',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF333333),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/howtomeasure.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F0F3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: _buildMeasureResult()),
              ),
            ),
            const SizedBox(height: 16),
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }
}
