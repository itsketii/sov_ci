import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/page_12_view_model.dart';
import '../page_11/page_11_view.dart';

class Page12View extends StatelessWidget {
  const Page12View({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Page12ViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isGuest) return _buildGuestScreen(context, viewModel);

        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(viewModel),
                _buildProfileContent(context, viewModel),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGuestScreen(BuildContext context, Page12ViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('👤', style: TextStyle(fontSize: 80)),
              const SizedBox(height: 20),
              const Text('Profil Personnel', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                'Connectez-vous pour voir vos informations et gérer vos préférences.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D7A32),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text('Se connecter', style: TextStyle(color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Retour', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Page12ViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
      decoration: const BoxDecoration(
        color: Color(0xFF2D7A32),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 2),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF673AB7),
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFFE67E22),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            viewModel.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${viewModel.level} • ${viewModel.school}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, Page12ViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('INFORMATIONS PERSONNELLES'),
          const SizedBox(height: 15),
          _buildInfoCard([
            _buildInfoTile(
              icon: Icons.school,
              iconBg: Colors.blue.shade50,
              iconColor: Colors.blue,
              title: 'Niveau d\'études',
              value: viewModel.level,
            ),
            const Divider(height: 1),
            _buildInfoTile(
              icon: Icons.location_on,
              iconBg: Colors.orange.shade50,
              iconColor: Colors.orange,
              title: 'Ville de résidence',
              value: viewModel.city,
            ),
            const Divider(height: 1),
            _buildInfoTile(
              icon: Icons.bar_chart,
              iconBg: Colors.pink.shade50,
              iconColor: Colors.pink,
              title: 'Moyenne générale',
              value: '${viewModel.average} / 20',
            ),
          ]),
          const SizedBox(height: 30),
          _buildSectionTitle('PARAMÈTRES ET AIDE'),
          const SizedBox(height: 15),
          _buildInfoCard([
            _buildActionTile(
              icon: Icons.dark_mode,
              title: 'Mode sombre',
              trailing: Switch(
                value: viewModel.isDarkMode,
                onChanged: (_) => viewModel.toggleDarkMode(),
                activeColor: const Color(0xFF2D7A32),
              ),
            ),
            const Divider(height: 1),
            _buildActionTile(
              icon: Icons.help_outline,
              title: 'Centre d\'aide & FAQ',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Page11View())),
            ),
            const Divider(height: 1),
            _buildActionTile(
              icon: Icons.logout,
              title: 'Déconnexion',
              textColor: Colors.red,
              iconColor: Colors.red,
              onTap: () {
                viewModel.setGuestMode(true);
              },
            ),
          ]),
          const SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('Supprimer mon compte', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade600,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: iconColor, size: 24),
      ),
      title: Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor ?? Colors.grey.shade600),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor ?? Colors.black87,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
