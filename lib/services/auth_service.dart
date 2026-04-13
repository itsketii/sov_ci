class AuthResult {
  final bool isSuccess;
  final String data;
  AuthResult.success(this.data) : isSuccess = true;
  AuthResult.error(this.data)   : isSuccess = false;
}

class AuthService {
  static String? _currentUserName;
  static String? _currentUserEmail;

  // Utilisateurs enregistrés en mémoire
  static final Map<String, Map<String, String>> _users = {
    'demo@sov.ci': {'name': 'Kouame', 'password': 'demo1234'},
  };

  static Future<AuthResult> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final e = email.trim().toLowerCase();
    final user = _users[e];
    if (user == null) return AuthResult.error('Aucun compte trouvé avec cet email.');
    if (user['password'] != password) return AuthResult.error('Mot de passe incorrect.');
    _currentUserName  = user['name']!;
    _currentUserEmail = e;
    return AuthResult.success(user['name']!);
  }

  static Future<AuthResult> register(
      String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final e = email.trim().toLowerCase();
    if (_users.containsKey(e)) {
      return AuthResult.error('Un compte existe déjà avec cet email.');
    }
    _users[e] = {'name': name.trim(), 'password': password};
    _currentUserName  = name.trim();
    _currentUserEmail = e;
    return AuthResult.success(name.trim());
  }

  static String? get currentUserName  => _currentUserName;
  static String? get currentUserEmail => _currentUserEmail;

  static void logout() {
    _currentUserName  = null;
    _currentUserEmail = null;
  }
}
