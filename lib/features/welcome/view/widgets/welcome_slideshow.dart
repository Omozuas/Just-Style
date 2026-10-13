import 'dart:async';

import 'package:flutter/material.dart';

class WelcomeSlideshow extends StatefulWidget {
  const WelcomeSlideshow({super.key, required this.images});

  final List<String> images;

  @override
  State<WelcomeSlideshow> createState() => _WelcomeSlideshowState();
}

class _WelcomeSlideshowState extends State<WelcomeSlideshow>
    with SingleTickerProviderStateMixin {
  static const _hold = Duration(seconds: 10);
  static const _fade = Duration(milliseconds: 1000);

  late final AnimationController _fadeController;
  Timer? _timer;
  int _currentIndex = 0;
  int _nextIndex = 0;

  @override
  void initState() {
    super.initState();
    _nextIndex = widget.images.length > 1 ? 1 : 0;
    _fadeController = AnimationController(vsync: this, duration: _fade);
    if (widget.images.length > 1) {
      _timer = Timer.periodic(_hold, (_) => _fadeToNext());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final image in widget.images) {
      precacheImage(AssetImage(image), context);
    }
  }

  void _fadeToNext() {
    if (!mounted || _fadeController.isAnimating || widget.images.isEmpty) {
      return;
    }
    setState(() {
      _nextIndex = (_currentIndex + 1) % widget.images.length;
    });
    _fadeController.forward().whenComplete(() {
      if (!mounted) return;
      setState(() => _currentIndex = _nextIndex);
      _fadeController.value = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  Widget _photo(String asset) {
    return Image.asset(
      asset,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) return const SizedBox.shrink();

    return Stack(
      fit: StackFit.expand,
      children: [
        _photo(widget.images[_currentIndex]),
        AnimatedBuilder(
          animation: _fadeController,
          builder: (context, child) {
            return Opacity(opacity: _fadeController.value, child: child);
          },
          child: _photo(widget.images[_nextIndex]),
        ),
      ],
    );
  }
}
