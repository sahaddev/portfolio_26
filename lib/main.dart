import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'core/theme/app_theme.dart';
import 'sections/projects_section.dart';
import 'sections/service_provider.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio',
          theme: AppTheme.darkTheme,
          home: const PortfolioHomePage(),
        );
      },
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // HeaderSection(),
            // AboutSection(),
            // SkillsSection(),
            // ServiceProvider(),
            ProjectsSection(),
            // ContactSection(),
          ],
        ),
      ),
    );
  }
}
