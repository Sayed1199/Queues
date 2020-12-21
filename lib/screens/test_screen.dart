import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(child: Center(

        child: CustomPaint(
          size: Size(300, 300),
          painter: MyPainter(),
        ),

      ),
      ),
      
    );
  }
}
class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(100, 50);
    final p2 = Offset(100, 300);
    final p3 = Offset(100, 300);
    final p4 = Offset(300, 300);
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1;
    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);

  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}