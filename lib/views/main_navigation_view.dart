import 'package:flutter/material.dart';
import '../widgets/sov_widgets.dart'; // Pour utiliser AppColors
import 'page_05/page_05_view.dart'; // Accueil
import 'page_09/page_09_view.dart'; // Orientation
import 'page_10/page_10_view.dart'; // Planning
import 'page_11/page_11_view.dart'; // FAQ
import 'page_12/page_12_view.dart'; // Profil

class MainNavigationView extends StatefulWidget {
  final String userName;
  const MainNavigationView({super.key, this.userName = "Utilisateur"});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Liste des pages regroupées dans le menu
    final List<Widget> pages = [
      Page05View(userName: widget.userName), // Onglet 1 : Accueil
      const Page09View(),                     // Onglet 2 : Orientation
      const Page10View(),                     // Onglet 3 : Planning
      const Page11View(),                     // Onglet 4 : FAQ
      const Page12View(),                     // Onglet 5 : Profil
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.orange, // Utilisation de la couleur officielle
          unselectedItemColor: const Color(0xFFB0B0C0),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Test',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_today),
              label: 'Planning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              activeIcon: Icon(Icons.help),
              label: 'FAQ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
