import 'package:flutter/material.dart';
import '../page_02/page_02_view.dart';

class OnboardingSlide {
  final String emoji, title, subtitle;
  final Color color;
  const OnboardingSlide(this.emoji, this.title, this.subtitle, this.color);
}

const _slides = [
  OnboardingSlide(
    '🎓',
    'Bienvenue sur SOV',
    "Le Salon d'Orientation Virtuel\nde Côte d'Ivoire",
    Color(0xFFFF6B2B),
  ),
  OnboardingSlide(
    '🏫',
    'Explore les établissements',
    'Plus de 180 écoles, universités\net centres de formation',
    Color(0xFF4A7CF7),
  ),
  OnboardingSlide(
    '🚀',
    'Construis ton avenir',
    'Trouve la filière qui te correspond\net postule en ligne',
    Color(0xFF00A86B),
  ),
];

class Page04View extends StatefulWidget {
  const Page04View({super.key});

  @override
  State<Page04View> createState() => _Page04ViewState();
}

class _Page04ViewState extends State<Page04View> {
  final _ctrl = PageController();
  int _page = 0;

  void _finish() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Page02View()),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slide = _slides[_page];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 16, 0),
              child: TextButton(
                onPressed: _finish,
                child: const Text('Passer',
                    style: TextStyle(
                        color: Color(0xFF9A9AB0), fontSize: 14)),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _ctrl,
              itemCount: _slides.length,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (_, i) => _buildSlide(_slides[i]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_slides.length, (i) {
              final active = i == _page;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: active ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: active ? slide.color : const Color(0xFFE4E4EC),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (_page < _slides.length - 1) {
                    _ctrl.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _finish();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: slide.color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: Text(
                  _page < _slides.length - 1 ? 'Suivant' : 'Commencer',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 36),
        ]),
      ),
    );
  }

  Widget _buildSlide(OnboardingSlide s) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: s.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(s.emoji,
                  style: const TextStyle(fontSize: 72)),
            ),
          ),
          const SizedBox(height: 40),
          Text(s.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0D0D1A),
                  height: 1.2)),
          const SizedBox(height: 16),
          Text(s.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF9A9AB0),
                  height: 1.6)),
        ],
      ),
    );
  }
}
