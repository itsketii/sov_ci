import 'package:flutter/material.dart';
import '../../widgets/sov_widgets.dart';
import '../../services/auth_service.dart';
import '../main_navigation_view.dart';

class Page03View extends StatefulWidget {
  const Page03View({super.key});

  @override
  State<Page03View> createState() => _Page03ViewState();
}

class _Page03ViewState extends State<Page03View> {
  final _nameCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _passCtrl    = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool    _obscure        = true;
  bool    _obscureConfirm = true;
  bool    _loading        = false;
  String? _nameError;
  String? _emailError;
  String? _passError;
  String? _confirmError;
  String? _globalError;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      _nameError = _emailError = _passError = _confirmError = _globalError = null;
    });
    bool ok = true;
    if (_nameCtrl.text.trim().isEmpty) {
      setState(() => _nameError = 'Veuillez saisir votre nom');
      ok = false;
    }
    if (_emailCtrl.text.trim().isEmpty) {
      setState(() => _emailError = 'Veuillez saisir votre email');
      ok = false;
    } else if (!_emailCtrl.text.contains('@')) {
      setState(() => _emailError = 'Adresse email invalide');
      ok = false;
    }
    if (_passCtrl.text.length < 6) {
      setState(() => _passError = 'Minimum 6 caractères');
      ok = false;
    }
    if (_confirmCtrl.text != _passCtrl.text) {
      setState(() => _confirmError = 'Les mots de passe ne correspondent pas');
      ok = false;
    }
    return ok;
  }

  void _register() async {
    if (!_validate()) return;
    setState(() => _loading = true);
    final result = await AuthService.register(
        _nameCtrl.text, _emailCtrl.text, _passCtrl.text);
    if (!mounted) return;
    setState(() => _loading = false);
    if (result.isSuccess) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => MainNavigationView(userName: result.data)),
              (_) => false);
    } else {
      setState(() => _globalError = result.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                color: AppColors.dark, size: 20),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
          child: Column(children: [
            const SOVLogo(size: 60),
            const SizedBox(height: 18),
            const Text('Créer un compte',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.dark)),
            const SizedBox(height: 6),
            const Text('Rejoins la communauté SOV',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
            const SizedBox(height: 28),
            if (_globalError != null) buildErrorBox(_globalError!),
            SOVTextField(
                controller: _nameCtrl,
                hint: 'Prénom et Nom',
                icon: Icons.person_outline,
                errorText: _nameError),
            const SizedBox(height: 14),
            SOVTextField(
                controller: _emailCtrl,
                hint: 'Adresse email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                errorText: _emailError),
            const SizedBox(height: 14),
            SOVTextField(
              controller: _passCtrl,
              hint: 'Mot de passe (min. 6 caractères)',
              icon: Icons.lock_outline,
              obscureText: _obscure,
              errorText: _passError,
              suffixIcon: IconButton(
                icon: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.hint, size: 20),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
            const SizedBox(height: 14),
            SOVTextField(
              controller: _confirmCtrl,
              hint: 'Confirmer le mot de passe',
              icon: Icons.lock_outline,
              obscureText: _obscureConfirm,
              errorText: _confirmError,
              suffixIcon: IconButton(
                icon: Icon(
                    _obscureConfirm
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.hint, size: 20),
                onPressed: () =>
                    setState(() => _obscureConfirm = !_obscureConfirm),
              ),
            ),
            const SizedBox(height: 28),
            GradientButton(
                label: "S'inscrire",
                onPressed: _loading ? null : _register,
                isLoading: _loading,
                colors: const [Color(0xFF00A86B), Color(0xFF00C878)]),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Déjà un compte ? ',
                    style: TextStyle(
                        color: AppColors.textSecondary, fontSize: 14)),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text('Se connecter',
                        style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 14))),
              ],
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
