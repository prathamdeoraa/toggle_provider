import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  /// nextPage: widget to navigate to after splash finishes
  final Widget nextPage;

  /// totalDuration: how long before navigation (ms)
  final int totalDuration;
  const SplashScreen({
    super.key,
    required this.nextPage,
    this.totalDuration = 2600, // default 2.6s
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    // Controller drives scale/fade/slide animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scale = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // start animation
    _controller.forward();

    // Navigate after given totalDuration (lets animation play + small pause)
    Timer(Duration(milliseconds: widget.totalDuration), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 2),
          pageBuilder: (context, a1, a2) => widget.nextPage,
          transitionsBuilder: (context, a1, a2, child) {
            final curved = CurvedAnimation(parent: a1, curve: Curves.easeOut);
            return FadeTransition(opacity: curved, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('asset/image.jpg', fit: BoxFit.fitHeight),
          ),

          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 50,),
                Text(
                  'WELCOME',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ],
            ),
          ),

          // Background gradient

          // Bottom indicator / small loading animation
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // simple circular progress
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.95),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
