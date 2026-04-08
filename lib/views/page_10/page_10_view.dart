import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/page_10_view_model.dart';
import '../../models/orientation_models.dart';

class Page10View extends StatelessWidget {
  const Page10View({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Page10ViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isGuest) return _buildGuestScreen(context);

        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          body: Stack(
            children: [
              Column(
                children: [
                  _buildHeader(context, viewModel),
                  _buildTabs(viewModel),
                  Expanded(
                    child: viewModel.isLoading
                        ? const Center(child: CircularProgressIndicator(color: Color(0xFFE67E22)))
                        : viewModel.favorites.isEmpty 
                            ? _buildEmptyState(viewModel)
                            : _buildFavoritesList(viewModel),
                  ),
                ],
              ),
              if (viewModel.selectedForComparison.isNotEmpty)
                _buildComparisonBottomBar(context, viewModel),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(Page10ViewModel viewModel) {
    String type = viewModel.userLevel == StudentLevel.bepc ? "lycées" : "universités";
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark_border, size: 100, color: Colors.grey.shade300),
            const SizedBox(height: 20),
            const Text('Votre liste est vide', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 10),
            Text(
              'Ajoutez des $type en favoris depuis le catalogue pour commencer votre planification.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🔒', style: TextStyle(fontSize: 80)),
              const SizedBox(height: 20),
              const Text('Espace Personnel', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text('Connectez-vous pour planifier votre orientation.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE67E22), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                child: const Text('Retour', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Page10ViewModel viewModel) {
    bool isBepc = viewModel.userLevel == StudentLevel.bepc;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 30),
      decoration: const BoxDecoration(color: Color(0xFFE67E22), borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('⭐', style: TextStyle(fontSize: 32)),
          Text(
            isBepc ? 'Ma Planification Lycée' : 'Mon Avenir Supérieur',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            '${viewModel.favorites.length} éléments sauvegardés',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(Page10ViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 55,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            _tabButton(viewModel, 0, 'Suivi Dossiers', Icons.assignment_turned_in),
            _tabButton(viewModel, 1, 'Analyse & Détails', Icons.analytics),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(Page10ViewModel viewModel, int index, String label, IconData icon) {
    bool sel = viewModel.selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => viewModel.setTabIndex(index),
        child: Container(
          decoration: BoxDecoration(color: sel ? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: sel ? const Color(0xFFE67E22) : Colors.grey),
              const SizedBox(width: 8),
              Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: sel ? Colors.black : Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritesList(Page10ViewModel viewModel) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
      itemCount: viewModel.favorites.length,
      itemBuilder: (context, index) {
        final est = viewModel.favorites[index];
        return viewModel.selectedTabIndex == 0 ? _buildSuiviCard(viewModel, est) : _buildAnalyseCard(viewModel, est);
      },
    );
  }

  Widget _buildSuiviCard(Page10ViewModel viewModel, Establishment est) {
    return _baseCard(
      viewModel, est,
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(value: est.isSelected, activeColor: const Color(0xFFE67E22), onChanged: (_) => viewModel.toggleSelection(est.id)),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(est.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(est.field, style: const TextStyle(color: Color(0xFF27AE60), fontSize: 13)),
              ])),
            ],
          ),
          const SizedBox(height: 15),
          _stepper(viewModel, est),
        ],
      ),
    );
  }

  Widget _buildAnalyseCard(Page10ViewModel viewModel, Establishment est) {
    return _baseCard(
      viewModel, est,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(est.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoBadge('Frais', est.fees, Colors.blue),
              _infoBadge('Insertion', est.insertionRate, Colors.green),
              _infoBadge('Note', '⭐' * est.reputation, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoBadge(String l, String v, Color c) {
    return Column(children: [
      Text(l, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: c.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
        child: Text(v, style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    ]);
  }

  Widget _baseCard(Page10ViewModel viewModel, Establishment est, {required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
      child: child,
    );
  }

  Widget _stepper(Page10ViewModel viewModel, Establishment est) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _step(est, ApplicationStatus.enPrepa, 'Prépa', viewModel),
        _line(est, ApplicationStatus.depose),
        _step(est, ApplicationStatus.depose, 'Déposé', viewModel),
        _line(est, ApplicationStatus.enAttente),
        _step(est, ApplicationStatus.enAttente, 'Attente', viewModel),
        _line(est, ApplicationStatus.accepte),
        _step(est, ApplicationStatus.accepte, 'Admis', viewModel),
      ],
    );
  }

  Widget _step(Establishment est, ApplicationStatus status, String label, Page10ViewModel viewModel) {
    bool done = est.status.index >= status.index;
    Color color = done ? const Color(0xFF27AE60) : Colors.grey.shade300;
    return GestureDetector(
      onTap: () => viewModel.updateStatus(est.id, status),
      child: Column(children: [
        CircleAvatar(radius: 10, backgroundColor: color, child: done ? const Icon(Icons.check, size: 12, color: Colors.white) : null),
        Text(label, style: TextStyle(fontSize: 10, color: color)),
      ]),
    );
  }

  Widget _line(Establishment est, ApplicationStatus next) {
    bool active = est.status.index >= next.index;
    return Expanded(child: Container(height: 2, margin: const EdgeInsets.only(bottom: 12), color: active ? const Color(0xFF27AE60) : Colors.grey.shade200));
  }

  Widget _buildComparisonBottomBar(BuildContext context, Page10ViewModel viewModel) {
    return Positioned(
      bottom: 30, left: 30, right: 30,
      child: ElevatedButton(
        onPressed: () => _showComp(context, viewModel),
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE67E22), padding: const EdgeInsets.all(15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        child: Text('COMPARER (${viewModel.selectedForComparison.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  void _showComp(BuildContext context, Page10ViewModel vm) {
    showModalBottomSheet(
      context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_) => Container(
        height: 500, decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(children: [
          const Padding(padding: EdgeInsets.all(20), child: Text('⚖️ Comparatif', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Expanded(child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: vm.selectedForComparison.map((e) => _compCol(e)).toList()))),
        ]),
      ),
    );
  }

  Widget _compCol(Establishment e) {
    return Container(width: 180, padding: const EdgeInsets.all(20), decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey.shade100))), child: Column(children: [
      Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      const Divider(),
      _compRow('FRAIS', e.fees),
      _compRow('INSERTION', e.insertionRate),
      _compRow('NOTE', '⭐' * e.reputation),
    ]));
  }

  Widget _compRow(String l, String v) => Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Column(children: [Text(l, style: const TextStyle(fontSize: 10, color: Colors.grey)), Text(v, style: const TextStyle(fontWeight: FontWeight.bold))]));
}
