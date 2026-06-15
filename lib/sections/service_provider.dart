import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../core/theme/app_theme.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      _Skill(
        'Mobile App Development',
        'Building high-performance, cross-platform mobile applications for iOS and Android using Flutter and Dart.',
        'https://cdn-icons-png.flaticon.com/512/2920/2920329.png',
      ),
      _Skill(
        'Web Development',
        'Creating responsive and interactive web applications using modern technologies and frameworks.',
        'https://cdn-icons-png.flaticon.com/512/2721/2721297.png',
      ),
      _Skill(
        'State Management',
        'Implementing scalable and maintainable architectures using BLoC, Cubit, Provider, and GetX.',
        'https://cdn-icons-png.flaticon.com/512/3242/3242257.png',
      ),
      _Skill(
        'Database Solutions',
        'Managing local and cloud databases including Hive, sqflite, and MongoDB for optimal performance.',
        'https://cdn-icons-png.flaticon.com/512/4248/4248443.png',
      ),
      _Skill(
        'Cloud Infrastructure',
        'Deploying and managing scalable applications using AWS services like EC2 and Route53.',
        'https://cdn-icons-png.flaticon.com/512/4144/4144785.png',
      ),
      _Skill(
        'API Integration',
        'Securely connecting mobile and web applications with robust RESTful APIs and backend services.',
        'https://cdn-icons-png.flaticon.com/512/2721/2721269.png',
      ),
      _Skill(
        'Clean Architecture',
        'Structuring applications with Clean Architecture and MVC patterns for long-term maintainability.',
        'https://cdn-icons-png.flaticon.com/512/2115/2115958.png',
      ),
      _Skill(
        'Performance Optimization',
        'Improving app load times, rendering performance, and overall user experience.',
        'https://cdn-icons-png.flaticon.com/512/1828/1828919.png',
      ),
    ];

    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'Services I Provide',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'I offer a range of services to help businesses and individuals achieve their goals.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: AppColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          SizedBox(height: 8.h),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isDesktop = constraints.maxWidth > 1000;
              bool isTablet =
                  constraints.maxWidth > 650 && constraints.maxWidth <= 1000;

              int crossAxisCount = isDesktop ? 4 : (isTablet ? 2 : 1);
              double aspectRatio = isDesktop ? 0.7 : (isTablet ? 0.85 : 1.2);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.h,
                  childAspectRatio: aspectRatio,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return _SkillCard(skill: skills[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Skill {
  final String title;
  final String description;
  final String iconUrl;
  _Skill(this.title, this.description, this.iconUrl);
}

class _SkillCard extends StatefulWidget {
  final _Skill skill;
  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovering
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        padding: const EdgeInsets.all(1), // Border thickness
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: _isHovering
              ? const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    AppColors.outlineVariant.withValues(alpha: 0.2),
                    AppColors.outlineVariant.withValues(alpha: 0.1),
                  ],
                ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                child: Image.network(
                  widget.skill.iconUrl,
                  height: 40.0,
                  color: AppColors.primary,
                  colorBlendMode: BlendMode.srcIn,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.code,
                    size: 40.0,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                widget.skill.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.skill.description,
                textAlign: TextAlign.center,
                maxLines: 4,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
