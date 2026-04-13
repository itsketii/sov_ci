import 'package:flutter/material.dart';
import '../../widgets/sov_widgets.dart';
import '../../services/auth_service.dart';
import '../page_03/page_03_view.dart';
import '../main_navigation_view.dart';

class Page02View extends StatefulWidget {
  const Page02View({super.key});
  @override
  State<Page02View> createState() => _Page02ViewState();
}

class _Page02ViewState extends State<Page02View>
    with SingleTickerProviderStateMixin {
  final _emailCtrl = TextEditingController();
  final _passCtrl  = TextEditingController();
  bool    _obscure      = true;
  bool    _loading      = false;
  String? _emailError;
  String? _passError;
  String? _globalError;
  late AnimationController _animCtrl;
  late Animation<double>   _fadeAnim;
  late Animation<Offset>   _slideAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    _fadeAnim  = CurvedAnimation(parent: _animCtrl, curve: Curves.easeIn);
    _slideAnim = Tween<Offset>(
        begin: const Offset(0, 0.22), end: Offset.zero)
        .animate(CurvedAnimation(
        parent: _animCtrl, curve: Curves.easeOutCubic));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() => _emailError = _passError = _globalError = null);
    bool ok = true;
    if (_emailCtrl.text.trim().isEmpty) {
      setState(() => _emailError = 'Veuillez saisir votre email');
      ok = false;
    } else if (!_emailCtrl.text.contains('@')) {
      setState(() => _emailError = 'Adresse email invalide');
      ok = false;
    }
    if (_passCtrl.text.isEmpty) {
      setState(() => _passError = 'Veuillez saisir votre mot de passe');
      ok = false;
    }
    return ok;
  }

  void _login() async {
    if (!_validate()) return;
    setState(() => _loading = true);
    final result = await AuthService.login(_emailCtrl.text, _passCtrl.text);
    if (!mounted) return;
    setState(() => _loading = false);
    if (result.isSuccess) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => MainNavigationView(userName: result.data)));
    } else {
      setState(() => _globalError = result.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEFEFF4), Color(0xFFFFFFFF)]),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnim,
            child: SlideTransition(
              position: _slideAnim,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const SOVLogo(),
                    const SizedBox(height: 28),
                    const Text('Bon retour 👋',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: AppColors.dark,
                            letterSpacing: -0.5)),
                    const SizedBox(height: 6),
                    const Text('Connecte-toi pour continuer',
                        style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
                    const SizedBox(height: 36),
                    if (_globalError != null) buildErrorBox(_globalError!),
                    SOVTextField(
                        controller: _emailCtrl,
                        hint: 'Adresse email',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        errorText: _emailError),
                    const SizedBox(height: 14),
                    SOVTextField(
                      controller: _passCtrl,
                      hint: 'Mot de passe',
                      icon: Icons.lock_outline,
                      obscureText: _obscure,
                      errorText: _passError,
                      suffixIcon: IconButton(
                        icon: Icon(
                            _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: AppColors.hint, size: 20),
                        onPressed: () => setState(() => _obscure = !_obscure),
                      ),
                    ),
                    const SizedBox(height: 28),
                    GradientButton(
                        label: 'Se connecter',
                        onPressed: _loading ? null : _login,
                        isLoading: _loading),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Pas encore de compte ? ",
                            style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                        GestureDetector(
                          onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_) => const Page03View()));
                          },
                          child: const Text("S'inscrire",
                              style: TextStyle(
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Compte démo
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF8F8FB),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.border, width: 1)),
                      child: Row(children: [
                        Container(
                          width: 36, height: 36,
                          decoration: BoxDecoration(
                              color: AppColors.green.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: const Icon(Icons.lightbulb_outline,
                              color: AppColors.green, size: 18),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Compte démo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: AppColors.dark)),
                              SizedBox(height: 2),
                              Text('demo@sov.ci  •  demo1234',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.textSecondary)),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
