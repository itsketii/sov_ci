import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/page_09_view_model.dart';
import '../../models/orientation_models.dart';

class Page09View extends StatelessWidget {
  const Page09View({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Page09ViewModel>(
      builder: (context, viewModel, child) {
        final isBepc = viewModel.level == StudentLevel.bepc;
        final themeColor = isBepc ? const Color(0xFFE67E22) : const Color(0xFF27AE60);
        final question = viewModel.currentQuestion;

        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          body: Column(
            children: [
              // HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 50, 24, 30),
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Mon Orientation', 
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(isBepc ? 'Trouve ta voie après le BEPC' : 'Trouve ta voie après le BAC',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 16)),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(isBepc ? Icons.school : Icons.workspace_premium, color: Colors.white, size: 16),
                          const SizedBox(width: 8),
                          Text(isBepc ? 'Niveau: Collège (3ème)' : 'Niveau: Lycée (Terminale)',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // PROGRESS
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Question ${viewModel.currentIndex + 1} sur ${viewModel.questions.length}',
                            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)),
                        Text(viewModel.progressPercent, 
                            style: TextStyle(fontWeight: FontWeight.bold, color: themeColor)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: viewModel.progress,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(themeColor),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),

              // QUESTION & OPTIONS
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('QUESTION ${viewModel.currentIndex + 1}',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: themeColor, letterSpacing: 1.5)),
                      const SizedBox(height: 10),
                      Text(question.text, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
                      const SizedBox(height: 20),
                      // HINT BOX
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: themeColor.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: themeColor.withValues(alpha: 0.2)),
                        ),
                        child: Row(
                          children: [
                            const Text('💡', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 12),
                            Expanded(child: Text(question.hint, style: const TextStyle(fontSize: 13, color: Colors.black54))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      // OPTIONS
                      ...question.options.map((opt) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () => viewModel.answer(opt),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade200),
                              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: Colors.grey.shade50, shape: BoxShape.circle),
                                  child: Text(opt.icon, style: const TextStyle(fontSize: 20)),
                                ),
                                const SizedBox(width: 15),
                                Expanded(child: Text(opt.text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                                Icon(Icons.radio_button_off, color: Colors.grey.shade300),
                              ],
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
