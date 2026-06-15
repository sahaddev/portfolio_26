import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'core/theme/app_theme.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/header_section.dart';
import 'sections/projects_section.dart';
import 'sections/service_provider.dart';
import 'sections/skills_section.dart';

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

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final headerKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(
              key: headerKey,
              onNavTap: (String section) {
                switch (section) {
                  case 'Home':
                    scrollToSection(headerKey);
                    break;
                  case 'About':
                    scrollToSection(aboutKey);
                    break;
                  case 'Services':
                    scrollToSection(servicesKey);
                    break;
                  case 'Projects':
                    scrollToSection(projectsKey);
                    break;
                  case 'Contact':
                    scrollToSection(contactKey);
                    break;
                }
              },
            ),
            AboutSection(key: aboutKey),
            const SkillsSection(),
            ServiceProvider(key: servicesKey),
            ProjectsSection(key: projectsKey),
            // ReviewSection(),
            ContactSection(key: contactKey),
          ],
        ),
      ),
    );
  }
}
