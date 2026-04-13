import 'dart:math';
import 'package:flutter/material.dart';
// Note: Le lien vers la page suivante sera mis à jour quand vous m'enverrez le code de la Page 2
// import '../page_02/page_02_view.dart'; 

class Page01View extends StatefulWidget {
  const Page01View({super.key});

  @override
  State<Page01View> createState() => _Page01ViewState();
}

class _Page01ViewState extends State<Page01View> with TickerProviderStateMixin {
  late final AnimationController _floatCtrl;
  late final AnimationController _glowCtrl;

  @override
  void initState() {
    super.initState();

    _floatCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    _glowCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    // Navigation vers la page suivante après 3 secondes
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      // Pour l'instant on ne navigue pas tant que la Page 2 n'est pas prête
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Page02View()));
    });
  }

  @override
  void dispose() {
    _floatCtrl.dispose();
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF2994A), // Orange de la maquette
              Color(0xFF27AE60), // Vert de la maquette
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            
            // Logo Central (Carré blanc arrondi avec icône)
            AnimatedBuilder(
              animation: _floatCtrl,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, sin(_floatCtrl.value * 2 * pi) * 10),
                  child: child,
                );
              },
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.school, // Icône chapeau de diplôme
                    size: 80,
                    color: Color(0xFF4A148C), // Violet comme sur l'image
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Texte SOV.CI
            const Text(
              "SOV.CI",
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            
            // Sous-titre
            const Text(
              "Salon d'Orientation Virtuelle",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const Spacer(),
            
            // Indicateur de chargement (les 3 points en bas)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(index == 1 ? 1 : 0.4),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
