import 'package:flutter/material.dart';
import '../models/orientation_models.dart';
import '../services/database_service.dart';

class Page10ViewModel extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  
  StudentLevel? _userLevel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  List<Establishment> _allFavorites = [];
  
  Page10ViewModel({StudentLevel? initialLevel}) {
    _userLevel = initialLevel;
    loadFavorites();
  }

  void setUserLevel(StudentLevel? level) {
    _userLevel = level;
    loadFavorites();
  }

  bool get isGuest => _userLevel == null;
  StudentLevel? get userLevel => _userLevel;

  Future<void> loadFavorites() async {
    if (isGuest) {
      _allFavorites = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Récupère uniquement ce que l'utilisateur a REELLEMENT mis en favoris
      final favoritesFromDb = await _dbService.getFavorites();
      
      if (_userLevel == StudentLevel.bepc) {
        _allFavorites = favoritesFromDb.where((e) => 
          e.type.contains('Lycée') || e.type.contains('Collège') || e.type.contains('Militaire')
        ).toList();
      } else {
        _allFavorites = favoritesFromDb.where((e) => 
          e.type.contains('Université') || e.type.contains('Grande École')
        ).toList();
      }
    } catch (e) {
      debugPrint('Erreur chargement: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<Establishment> get favorites => _allFavorites;
  List<Establishment> get selectedForComparison => _allFavorites.where((e) => e.isSelected).toList();

  void setTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void toggleSelection(String id) {
    final idx = _allFavorites.indexWhere((e) => e.id == id);
    if (idx != -1) {
      if (!_allFavorites[idx].isSelected && selectedForComparison.length >= 3) return;
      _allFavorites[idx].isSelected = !_allFavorites[idx].isSelected;
      notifyListeners();
    }
  }

  Future<void> updateStatus(String id, ApplicationStatus newStatus) async {
    final idx = _allFavorites.indexWhere((e) => e.id == id);
    if (idx != -1)
    {
      _allFavorites[idx].status = newStatus;
      await _dbService.updateFavoriteStatus(id, newStatus);
      notifyListeners();
    }
  }
}
