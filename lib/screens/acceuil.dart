import 'package:flutter/material.dart';


class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  int _selectedIndex = 0;

  static const Color primaryOrange = Color(0xFFF88500);
  static const Color quickTileTitleColor = Color(0xFF1D1D1D);
  static const Color statusGreen = Color(0xFF04A447);

  static const double appBarHeight = kToolbarHeight;
  static const double headerVerticalPadding = 24.0;
  static const double headerContentHeightEstimate = 220.0;

  @override
  Widget build(BuildContext context) {
    final double appBarAndHeaderHeight = appBarHeight + headerVerticalPadding + headerContentHeightEstimate;
    final double minContentHeight = MediaQuery.of(context).size.height - appBarAndHeaderHeight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryOrange,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 16,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text('SOV.CI'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: primaryOrange,
              padding: const EdgeInsets.fromLTRB(24, 10, 24, headerVerticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 100,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Color(0x22000000),
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFD96B00),
                                border: Border.all(color: Colors.white, width: 0.5),
                              ),
                            ),
                          ),
                          Container(width: 1, color: const Color(0xFFEAEAEA)),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey[300]!, width: 0.5),
                              ),
                            ),
                          ),
                          Container(width: 1, color: const Color(0xFFEAEAEA)),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF0A9A55),
                                border: Border.all(color: Colors.white, width: 0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'SOV.CI',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Salon d'Orientation Virtuelle",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Bonjour Kouame',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD87700),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Resultats BAC dans',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '23 jours',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: minContentHeight,
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
                      child: TextField(
                        style: const TextStyle(color: quickTileTitleColor),
                        decoration: InputDecoration(
                          hintText: 'Rechercher un etablissement...',
                          hintStyle: const TextStyle(color: Color(0xFF777777)),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF8E5CFF),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: primaryOrange),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
                      child: Text(
                        'ACCES RAPIDE',
                        style: TextStyle(fontSize: 22, color: Color(0xFF6B6B6B)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const <Widget>[
                          Expanded(
                            child: _QuickTile(
                              icon: Icons.home_work_rounded,
                              title: 'Annuaire',
                              subtitle: '180 etablissements',
                              startColor: Color(0xFF2E2417),
                              endColor: Color(0xFF2A1E13),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _QuickTile(
                              icon: Icons.collections_bookmark,
                              title: 'Filieres',
                              subtitle: 'Explorer les domaines',
                              startColor: Color(0xFF14372D),
                              endColor: Color(0xFF0D2320),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const <Widget>[
                          Expanded(
                            child: _QuickTile(
                              icon: Icons.explore,
                              title: 'Mon orientation',
                              subtitle: 'Test de profil',
                              startColor: Color(0xFF14372D),
                              endColor: Color(0xFF0D2320),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _QuickTile(
                              icon: Icons.help,
                              title: 'FAQ',
                              subtitle: 'Questions frequentes',
                              startColor: Color(0xFF2E2417),
                              endColor: Color(0xFF2A1E13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 22, 16, 12),
                      child: Text(
                        'EN VEDETTE',
                        style: TextStyle(fontSize: 22, color: Color(0xFFC0C4D0)),
                      ),
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        children: const <Widget>[
                          _FeaturedCard(
                            topColor: statusGreen,
                            title: 'Universite FHB',
                            status: 'Ouvert',
                            statusColor: statusGreen,
                          ),
                          SizedBox(width: 12),
                          _FeaturedCard(
                            topColor: primaryOrange,
                            title: 'INPHB Yamoussoukro',
                            status: 'Bientot',
                            statusColor: primaryOrange,
                          ),
                          SizedBox(width: 12),
                          _FeaturedCard(
                            topColor: statusGreen,
                            title: 'ESATIC',
                            status: 'Ouvert',
                            statusColor: statusGreen,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: primaryOrange,
          unselectedItemColor: const Color(0xFF0A0D14),
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              label: 'Annuaire',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoris'),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifs',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
          type: BottomNavigationBarType.fixed,
        ),
    );
  }
}

class _QuickTile extends StatelessWidget {
  const _QuickTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.startColor,
    required this.endColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color startColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Color.lerp(startColor, endColor, 0.35)!.withValues(alpha: 0.35)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: const Color(0xFFE7A95B), size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: _AcceuilState.quickTileTitleColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.05,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Color(0xFF6F7683), fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({
    required this.topColor,
    required this.title,
    required this.status,
    required this.statusColor,
  });

  final Color topColor;
  final String title;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 194,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(
              color: topColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: const Icon(Icons.home_work_rounded, color: Colors.white70, size: 30),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _AcceuilState.quickTileTitleColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}